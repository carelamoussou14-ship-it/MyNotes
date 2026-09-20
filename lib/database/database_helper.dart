import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance =
      DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(
    Database db,
    int version,
  ) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titre TEXT NOT NULL,
        contenu TEXT NOT NULL
      )
    ''');
  }

  // CREATE
  Future<int> insertNote(
    Map<String, dynamic> note,
  ) async {
    final db = await database;

    return await db.insert(
      'notes',
      note,
    );
  }

  // READ
  Future<List<Map<String, dynamic>>> getNotes() async {
    final db = await database;

    return await db.query(
      'notes',
      orderBy: 'id DESC',
    );
  }

  // UPDATE
  Future<int> updateNote(
    int id,
    Map<String, dynamic> note,
  ) async {
    final db = await database;

    return await db.update(
      'notes',
      note,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE
  Future<int> deleteNote(int id) async {
    final db = await database;

    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}