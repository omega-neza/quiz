// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/pages/home.dart';
import 'package:quizapp/pages/login_or_register.dart';
//import 'package:quizapp/pages/login_page.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
     body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        //userlogged in
        if(snapshot.hasData){
          return Home();
        }
        //user not logged in
        else{
          return const LoginOrRegisterPage();
        }

      }
     ),
   
    );
  }
}