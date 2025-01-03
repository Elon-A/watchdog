import 'package:flutter/material.dart';
import '../models/survey.dart';
import '../services/survey_service.dart';
import '../widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  final bool isLoggedIn;

  const HomeScreen({super.key, required this.isLoggedIn});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _surveyService = SurveyService();
  List<Survey> polls = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPolls();
  }

  Future<void> _loadPolls() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final fetchedPolls = await _surveyService.getPublicSurveys(limit: 10);
      setState(() {
        polls = fetchedPolls;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchdog App'),
        actions: [
          if (!widget.isLoggedIn)
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/auth');
              },
              child: const Text("Login/SignUp"),
            ),
          if (widget.isLoggedIn)
            IconButton(
              onPressed: () async {
                await Supabase.instance.client.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              icon: Icon(Icons.logout),
            )
        ],
      ),
      body: _isLoading
          ? const Center(child: LoadingIndicator())
          : RefreshIndicator(
            onRefresh: _loadPolls,
            child: ListView.builder(
                itemCount: polls.length,
                itemBuilder: (context, index) {
                  final poll = polls[index];
                  return Card(
                    child: ListTile(
                      title: Text(poll.title),
                      subtitle: Text(poll.description ?? ""),
                      trailing: widget.isLoggedIn
                          ? IconButton(
                              onPressed: () {
                                // Handle poll interaction
                              },
                              icon: const Icon(Icons.arrow_forward_ios))
                          : null,
                      onTap: () {
                        if (!widget.isLoggedIn) {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                          'You need to be logged in to participate.'),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushNamed(context, '/auth');
                                        },
                                        child: const Text('Sign Up / Log In'),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        } else {
                          // Navigate to poll details
                        }
                      },
                    ),
                  );
                },
              ),
            ),
    );
  }
}