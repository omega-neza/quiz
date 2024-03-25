
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/componets/mybutton.dart';
import 'package:quizapp/componets/textfield.dart';
import 'package:quizapp/componets/tile.dart';
//import 'signup_page.dart'; // Import the SignUpPage

class LoginPage extends StatefulWidget {
  final Function()? onTap;
 const LoginPage({super.key, required this.onTap});
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers for text
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Function to handle sign-in
 void signIn() async {
  // Check if admin credentials are used
  if (emailController.text == "admin@gmail.com" && passwordController.text == "admin123") {
    // Navigate to the admin page directly
    Navigator.pushNamed(context, '/admin_page');
    return; // Stop further execution
  }

  // Show loading indicator
  showDialog(
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // Dismiss loading indicator
    Navigator.pop(context);
  } catch (e) {
      // Dismiss loading indicator
      Navigator.pop(context);

      // Handle specific FirebaseAuthException errors
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          // Show dialog for incorrect email
          showDialog(
            // ignore: use_\build_context_synchronously
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Incorrect Email'),
              );
            },
          );
        } else if (e.code == 'wrong-password') {
          // Show dialog for incorrect password
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Incorrect Password'),
              );
            },
          );
        } else {
          // Show generic error dialog
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Error'),
                content: Text('Wrong email or password'),
              );
            },
          );
        }
      } else {
        // Show generic error dialog
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('An error occurred: $e'),
            );
          },
        );
      }
    }
  }

  // // Function to navigate to the signup page
  // void navigateToSignUp(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => SignUpPage()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // logo
                  const Icon(
                    Icons.account_circle,
                    size: 100,
                  ),
                  const SizedBox(height: 50),
                  // welcome back
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: Color.fromRGBO(18, 92, 153, 1),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // text field Email
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 25),
                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  // forgot password
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(177, 65, 127, 178),
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  // signin button
                  MyButton(
                    text: 'Sign In',
                    onTap: signIn, // Call signIn function
                  ),
              
                  const SizedBox(height: 50),
                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  // google button
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/images/black.png'),
                  ],
                ),
                const SizedBox(height: 50),
                // Not a member? Register

                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Not a member'),
                   const   SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                    ],
                  ),
                ],
                ),
                        ),
            ),
          ),
      ),
    );
    
  }
}
