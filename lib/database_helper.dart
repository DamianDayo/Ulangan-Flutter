import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('user_data.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _upgradeDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        isLoggedIn INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        category INTEGER NOT NULL,
        deadline TEXT NOT NULL,
        isDone INTEGER NOT NULL
      )
    ''');
  }

  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('DROP TABLE IF EXISTS todos');
      await db.execute('''
        CREATE TABLE todos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          description TEXT NOT NULL,
          category INTEGER NOT NULL,
          deadline TEXT NOT NULL,
          isDone INTEGER NOT NULL
        )
      ''');
    }
  }

  Future<void> saveLogin(String username) async {
    final db = await instance.database;
    await db.insert(
      'user',
      {'username': username, 'isLoggedIn': 1},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUser() async {
    final db = await instance.database;
    final result = await db.query('user', limit: 1);
    return result.isNotEmpty ? result.first : null;
  }

  Future<void> logout() async {
    final db = await instance.database;
    await db.delete('user');
  }

  Future<int> insertTodo(Map<String, dynamic> todo) async {
    final db = await instance.database;
    return await db.insert('todos', todo);
  }

  Future<List<Map<String, dynamic>>> getTodos() async {
    final db = await instance.database;
    return await db.query('todos');
  }

  Future<int> updateTodo(int id, Map<String, dynamic> todo) async {
    final db = await instance.database;
    return await db.update('todos', todo, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTodo(int id) async {
    final db = await instance.database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}