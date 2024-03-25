class MathQuizQuestion {
  String questionText;
  List<String> options;
  int correctAnswerIndex;

  MathQuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

List<MathQuizQuestion> mathQuizQuestions = [
  MathQuizQuestion(
    questionText: "What is the result of 5 + 7?",
    options: ["10", "11", "12", "13", "14"],
    correctAnswerIndex: 2,
  ),
  MathQuizQuestion(
    questionText: "What is 3 multiplied by 4?",
    options: ["6", "7", "10", "12", "14"],
    correctAnswerIndex: 3,
  ),
  MathQuizQuestion(
    questionText: "What is the square root of 64?",
    options: ["4", "6", "8", "10", "12"],
    correctAnswerIndex: 2,
  ),
  MathQuizQuestion(
    questionText: "What is the value of 'x' in the equation 2x + 5 = 15?",
    options: ["3", "5", "7", "10", "15"],
    correctAnswerIndex: 0,
  ),
  MathQuizQuestion(
    questionText: "What is the area of a square with side length 6 units?",
    options: ["12 sq. units", "18 sq. units", "24 sq. units", "30 sq. units", "36 sq. units"],
    correctAnswerIndex: 4,
  ),
];
