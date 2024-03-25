class HistoryQuizQuestion {
  String questionText;
  List<String> options;
  int correctAnswerIndex;

  HistoryQuizQuestion({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}

List<HistoryQuizQuestion> historyQuizQuestions = [
  HistoryQuizQuestion(
    questionText: "Who was the first President of the United States?",
    options: ["George Washington", "Thomas Jefferson", "Abraham Lincoln", "John Adams", "James Madison"],
    correctAnswerIndex: 0,
  ),
  HistoryQuizQuestion(
    questionText: "Which war was fought between the North and the South in the United States?",
    options: ["World War I", "World War II", "Civil War", "Vietnam War", "Korean War"],
    correctAnswerIndex: 2,
  ),
  HistoryQuizQuestion(
    questionText: "Who was the leader of the Soviet Union during the Cuban Missile Crisis?",
    options: ["Joseph Stalin", "Nikita Khrushchev", "Vladimir Lenin", "Mikhail Gorbachev", "Leonid Brezhnev"],
    correctAnswerIndex: 1,
  ),
  HistoryQuizQuestion(
    questionText: "Which document declared the American colonies' independence from Great Britain?",
    options: ["Bill of Rights", "Declaration of Independence", "Emancipation Proclamation", "Constitution", "Magna Carta"],
    correctAnswerIndex: 1,
  ),
  HistoryQuizQuestion(
    questionText: "Which civilization built the Great Pyramids of Giza?",
    options: ["Roman Empire", "Greek Empire", "Maya Civilization", "Inca Empire", "Ancient Egypt"],
    correctAnswerIndex: 4,
  ),
];
