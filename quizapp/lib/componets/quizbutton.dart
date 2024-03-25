import'package:flutter/material.dart';

class QuizButton extends StatelessWidget{

final Function()? onTap;

const QuizButton({super.key, required this.onTap});

//const QuizButton({super.key});

@override 
Widget build (BuildContext context){
  return GestureDetector(
    onTap: onTap ,
    child: Container(
      padding: const EdgeInsets.all(15),
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child:Text(
          "Take Quiz",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}




}