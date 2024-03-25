class ScienceQuizQuestion {
  String questionText;
  List<String> options;
  int correctAnswerIndex;

  ScienceQuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

List<ScienceQuizQuestion> scienceQuizQuestions = [
  ScienceQuizQuestion(
    questionText: "What is the chemical symbol for water?",
    options: ["H2O", "CO2", "CH4", "O2", "NH3"],
    correctAnswerIndex: 0,
  ),
  ScienceQuizQuestion(
    questionText: "What is the boiling point of water in Celsius?",
    options: ["0°C", "50°C", "100°C", "200°C", "300°C"],
    correctAnswerIndex: 2,
  ),
  ScienceQuizQuestion(
    questionText: "What is the atomic number of oxygen?",
    options: ["6", "8", "12", "16", "20"],
    correctAnswerIndex: 1,
  ),
  ScienceQuizQuestion(
    questionText: "What is the closest planet to the Sun?",
    options: ["Venus", "Earth", "Mars", "Mercury", "Saturn"],
    correctAnswerIndex: 3,
  ),
  ScienceQuizQuestion(
    questionText: "What is the largest organ in the human body?",
    options: ["Heart", "Liver", "Lung", "Skin", "Brain"],
    correctAnswerIndex: 3,
  ),
];
