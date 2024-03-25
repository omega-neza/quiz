import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,

  });

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller:controller,
        obscureText: obscureText,
        decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey), // Change border color when enabled
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white), // Change border color when focused
        ),
        
        filled: true,
        fillColor: Colors.grey[200], // Change background color
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      
      ),
      
      );
      
    
  }
}
