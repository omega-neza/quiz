import 'package:flutter/material.dart';
import 'package:quizapp/pages/login_page.dart';
import 'package:quizapp/pages/signup_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPagStateState();
}

class _LoginOrRegisterPagStateState extends State<LoginOrRegisterPage> {
//show login initially
bool showLoginPage = true;

//toggle between login and register page
void togglePages(){
  setState(() {
    showLoginPage = !showLoginPage; 
   });
}

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap:togglePages,
      );
    } else{
      return SignUpPage(
        onTap: togglePages,
      );
    }
  }
}