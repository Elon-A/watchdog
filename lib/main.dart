import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'views/home_screen.dart'; // Import your home screen
import 'views/auth_screen.dart'; // Import your auth screen

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env"); // Load environment variables

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? '',
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? '',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watchdog App',
      initialRoute: '/', // Initial route
      routes: {
        '/': (context) => const AuthWrapper(), // Route for authentication check
        '/auth': (context) => const AuthScreen(), // Route for auth screen
        '/home': (context) => const HomeScreen(isLoggedIn: true),//Route for home screen when logged in
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Session?>(
      future: supabase.auth.getSession(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen(isLoggedIn: true);
        } else {
          return const HomeScreen(isLoggedIn: false);
        }
      },
    );
  }
}