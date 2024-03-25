import 'package:flutter/material.dart';
import 'package:quizapp/componets/quizbutton.dart';
import 'package:quizapp/pages/historyquizscreen.dart';
import 'package:quizapp/pages/mathquizscreen.dart';
import 'package:quizapp/pages/sciencequizscreen.dart';
import 'package:quizapp/pages/triviaquizscreen.dart';


class Homepage extends StatelessWidget {
  // List of quiz names
  final List<String> quizNames = ["Trivia", "Science", "History", "Math"];

   Homepage({super.key});

  void navigateToQuizPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QuizScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScienceQuizScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HistoryQuizScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MathQuizScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Omega Igiraneza',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Below are the available quizzes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 20),
            // Map each quiz name to a QuizButton
            for (int i = 0; i < quizNames.length; i++)
              Column(
                children: [
                  Text(
                    quizNames[i],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  QuizButton(
                    onTap: () => navigateToQuizPage(context, i), // Pass index to navigateToQuizPage
                  ),
                  const SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
