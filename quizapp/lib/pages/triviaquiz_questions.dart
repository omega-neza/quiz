class QuizQuestion {
  String questionText;
  List<String> options;
  int correctAnswerIndex;

  QuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    questionText: "What is the capital of France?",
    options: ["London", "Paris", "Berlin", "Rome", "Madrid"],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    questionText: "What is the largest mammal?",
    options: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus", "Rhino"],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    questionText: "Which planet is known as the Red Planet?",
    options: ["Earth", "Mars", "Venus", "Mercury", "Saturn"],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    questionText: "What is the chemical symbol for water?",
    options: ["H2O", "CO2", "CH4", "O2", "NH3"],
    correctAnswerIndex: 0,
  ),
  QuizQuestion(
    questionText: "Who wrote 'To Kill a Mockingbird'?",
    options: [
      "Jane Austen",
      "Harper Lee",
      "Mark Twain",
      "J.K. Rowling",
      "Stephen King"
    ],
    correctAnswerIndex: 1,
  ),
  QuizQuestion(
    questionText: "What is the currency of Japan?",
    options: ["Yuan", "Yen", "Euro", "Dollar", "Pound"],
    correctAnswerIndex: 1,
  ),
];