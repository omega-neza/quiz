import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/pages/math_questions.dart';


class MathQuizScreen extends StatefulWidget {
  const MathQuizScreen({super.key});

  @override
  _MathQuizScreenState createState() => _MathQuizScreenState();
}

class _MathQuizScreenState extends State<MathQuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _secondsRemaining = 10; // Initial time for each question
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_secondsRemaining < 1) {
            timer.cancel();
            _nextQuestion();
          } else {
            _secondsRemaining--;
          }
        });
      },
    );
  }

  void _checkAnswer(int selectedIndex) {
    if (selectedIndex ==
        mathQuizQuestions[_currentQuestionIndex].correctAnswerIndex) {
      setState(() {
        _score++;
      });
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < mathQuizQuestions.length - 1) {
        _currentQuestionIndex++;
        _secondsRemaining = 10; // Reset the timer for the next question
        startTimer(); // Start the timer again for the next question
      } else {
        _showQuizCompleteDialog(); // Show quiz complete dialog
      }
    });
  }

  void _showQuizCompleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Complete'),
          content: Text('Your Score: $_score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Quiz'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Time Remaining: $_secondsRemaining seconds',
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 20.0),
              Text(
                mathQuizQuestions[_currentQuestionIndex].questionText,
                style: const TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              Column(
                children: List.generate(
                  mathQuizQuestions[_currentQuestionIndex].options.length,
                  (index) => ElevatedButton(
                    onPressed: () {
                      _checkAnswer(index);
                    },
                    child: Text(
                      mathQuizQuestions[_currentQuestionIndex].options[index],
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _nextQuestion,
                child: const Text('Next Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
