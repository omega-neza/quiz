import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String dbName = 'quiz.db';
  static const int dbVersion = 1;

  static const String quizTable = 'quiz';
  static const String questionTable = 'question';

  static const String colId = 'id';
  static const String colTitle = 'title';
  static const String colText = 'text';
  static const String colOptions = 'options';
  static const String colCorrectAnswer = 'correctAnswer';

  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    if (_instance == null) {
      _instance = DatabaseHelper._privateConstructor();
    }
    return _instance!;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $quizTable(
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colTitle TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $questionTable(
        $colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colText TEXT,
        $colOptions TEXT,
        $colCorrectAnswer INTEGER,
        $colTitle TEXT,
        FOREIGN KEY ($colTitle) REFERENCES $quizTable($colTitle) 
      )
    ''');
  }

  // CRUD methods for quizzes
  Future<int> insertQuiz(Map<String, dynamic> quiz) async {
    Database db = await database;
    return await db.insert(quizTable, quiz);
  }

  Future<List<Map<String, dynamic>>> getAllQuizzes() async {
    Database db = await database;
    return await db.query(quizTable);
  }

  // CRUD methods for questions
  Future<int> insertQuestion(Map<String, dynamic> question) async {
    Database db = await database;
    return await db.insert(questionTable, question);
  }

  Future<List<Map<String, dynamic>>> getQuestionsForQuiz(String quizTitle) async {
    Database db = await database;
    return await db.query(
      questionTable,
      where: '$colTitle = ?',
      whereArgs: [quizTitle],
    );
  }
}
