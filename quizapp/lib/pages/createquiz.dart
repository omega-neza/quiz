import 'package:flutter/material.dart';
import 'package:quizapp/class/database_helper.dart';
import 'package:quizapp/pages/quiztable.dart';
//import 'database_helper.dart'; // Import your database helper class

class CreateQuizPage extends StatefulWidget {
  const CreateQuizPage({Key? key}) : super(key: key);

  @override
  _CreateQuizPageState createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  final TextEditingController _titleController = TextEditingController();
  List<Question> _questions = [
    Question(question: '', options: ['', '', ''], correctAnswer: 0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quiz'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quiz Title:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Enter quiz title...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Questions:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Question:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _questions[index].question = value;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter question...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Options:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    for (int i = 0; i < _questions[index].options.length; i++)
                      TextFormField(
                        onChanged: (value) {
                          _questions[index].options[i] = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Option ${i + 1}',
                          border: OutlineInputBorder(),
                          suffixIcon: _buildCorrectAnswerDropdown(index, i),
                        ),
                      ),
                    const SizedBox(height: 10.0),
                  ],
                );
              },
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                _saveQuiz();
              },
              child: const Text(
                'Save Quiz',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCorrectAnswerDropdown(int questionIndex, int optionIndex) {
    return DropdownButton<int>(
      value: _questions[questionIndex].correctAnswer,
      onChanged: (value) {
        setState(() {
          _questions[questionIndex].correctAnswer = value!;
        });
      },
      items: List.generate(
        _questions[questionIndex].options.length,
        (index) => DropdownMenuItem(
          value: index,
          child: Text('Option ${index + 1}'),
        ),
      ),
    );
  }

  void _saveQuiz() {
    String quizTitle = _titleController.text;
    Quiz quiz = Quiz(title: quizTitle, questions: _questions);
    print(quiz); // Use the Quiz object to resolve the warning

    // Save the quiz to the database or perform any other action
    _saveQuizToDatabase();

    // Navigate to the quiz table page
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizTablePage()));

    // Show snackbar indicating that the quiz has been saved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Quiz saved successfully!'),
      ),
    );
  }

  void _saveQuizToDatabase() async {
    String quizTitle = _titleController.text;
    DatabaseHelper databaseHelper = DatabaseHelper();

    // Save quiz title
    // ignore: unused_local_variable
    int quizId = await databaseHelper.insertQuiz({
      'title': quizTitle,
    });

    // Save questions
    for (Question question in _questions) {
      await databaseHelper.insertQuestion({
        'text': question.question,
        'options': question.options.join(','),
        'correctAnswer': question.correctAnswer,
        'title': quizTitle,
      });
    }
  }
}

class Question {
  String question;
  List<String> options;
  int correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

class Quiz {
  String title;
  List<Question> questions;

  Quiz({
    required this.title,
    required this.questions,
  });
}
