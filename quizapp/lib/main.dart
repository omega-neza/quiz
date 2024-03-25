import 'package:flutter/material.dart';
import 'package:quizapp/pages/admin_page.dart';
import 'package:quizapp/pages/auth_page.dart';
import 'package:quizapp/pages/home.dart'; // Import the home.dart file
import 'package:quizapp/pages/homepage.dart';
import 'package:quizapp/pages/createquiz.dart'; // Import the create quiz page
import 'package:firebase_core/firebase_core.dart';
import 'package:quizapp/pages/login_page.dart';
import 'package:quizapp/pages/signup_page.dart';
import 'package:quizapp/pages/triviaquizscreen.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/registrationPage');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      //initialRoute: '/', // Set the initial route
      routes: {
       
        '/login': (context) => LoginPage(
  onTap: () {
    Navigator.pushNamed(context, '/signup'); // Replace '/signup' with the route for the signup page
  },
),

        '/homepage': (context) => Homepage(), // Define the route for the homepage
        '/quiz': (context) => const QuizScreen(), // Define the route for the quiz page
        '/home': (context) => Home(), // Define the route for the home page
        '/create_quiz': (context) => const CreateQuizPage(), // Define the route for the create quiz page
        '/admin_page': (context) => const AdminPage(),
        '/signup':(context) => SignUpPage(onTap: () {
          Navigator.pushNamed(context, '/login');
        },),
      },
    );
  }
}
