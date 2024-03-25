import 'package:flutter/material.dart';
import 'package:quizapp/class/database_helper.dart';

class QuizTablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Table'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().getAllQuizzes(), // Fetch all quizzes from the database
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Data retrieved successfully
            List<Map<String, dynamic>> quizzes = snapshot.data!;
            return ListView.builder(
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(quizzes[index]['title']),
                  // Add more ListTile properties to display additional quiz details
                );
              },
            );
          }
        },
      ),
    );
  }
}
