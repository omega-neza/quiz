import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/componets/mybutton.dart';
import 'package:quizapp/componets/textfield.dart';
import 'package:quizapp/componets/tile.dart';


class SignUpPage extends StatefulWidget {
  final Function()? onTap;

 const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // controllers for text
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController= TextEditingController();
  // Function to handle sign-in
  void signUserUp() async {
    // Show loading indicator
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
//signing up
    try {
      //check if password is confiremed
      if(passwordController.text==confirmController.text){
       await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      } else{
        //error message for unmatching 
      showErrorMessage("Passwords don't match");
      }

      // Dismiss loading indicator
      Navigator.pop(context);
    } on FirebaseAuthException catch(e) {
      // Dismiss loading indicator
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

void showErrorMessage(String message){
  showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: Colors.purple,
        title:Center(
          child:Text(
            message,
            style:const TextStyle(color: Colors.white),
          ),
          ),
      );
    },
  );
}
      

  

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
                  const SizedBox(height: 25),
                  // logo
                  const Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  const SizedBox(height: 25),

                  // create
                  const Text(
                    'Create an account',
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
                  const SizedBox(height: 25),
                  
                  //confirm  password textfield
                  MyTextField(
                    controller: confirmController,
                    hintText: 'confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  
                  
              
                  // signup button
                  MyButton(
                    text: 'Sign up',
                    onTap: signUserUp, // Call signIn function
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
                // ALready have an account
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already a member?'),
                   const   SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                        'Login now',
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
