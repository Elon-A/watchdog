import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'views/home_screen.dart';
import 'views/auth_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watchdog App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Example theme
        // Add other theme properties as needed (e.g., fontFamily, textTheme)
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthWrapper(),
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(isLoggedIn: true),
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

final supabase = Supabase.instance.client; // Keep this in app.dart