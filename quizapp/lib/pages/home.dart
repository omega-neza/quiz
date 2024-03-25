import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          // Removed IconButton that navigated to the create quiz page
        ],
      ),
      body: Column(
        children: [
          // Custom secondary AppBar
          Material(
            elevation: 4.0, // Optional: adds shadow below the appBar
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () {
                      signUserOut();
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('lib/assets/me.jpeg'),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "You are logged in as: ${user.email!}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to home page
                      Navigator.pushNamed(context, '/homepage');
                    },
                    child: const Text('Available Quizzes'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
