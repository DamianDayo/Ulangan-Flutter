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

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        isLoggedIn INTEGER NOT NULL
      )
    ''');
  }

  Future<void> saveLogin(String username) async {
    final db = await instance.database;
    await db.insert('user', {
      'username': username,
      'isLoggedIn': 1,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
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

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
