import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pas1_mobile_11pplg1_29/model/TeamModel.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('teams.db');
    return _database!;
  }

  Future<Database> _initDB(String path) async {
    final dbPath = await getDatabasesPath();
    final dbLocation = join(dbPath, path);
    return openDatabase(dbLocation, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE teams (
        idTeam INTEGER PRIMARY KEY,
        strTeam TEXT,
        strLeague TEXT,
        strBadge TEXT,
        isLiked INTEGER
      )
    ''');
  }

  Future<int> insertTeam(Team team) async {
    final db = await instance.database;
    return await db.insert('teams', team.toMap());
  }

  Future<int> updateTeam(Team team) async {
    final db = await instance.database;
    return await db.update(
      'teams',
      team.toMap(),
      where: 'idTeam = ?',
      whereArgs: [team.id],
    );
  }

  Future<int> deleteTeam(int id) async {
    final db = await instance.database;
    return await db.delete('teams', where: 'idTeam = ?', whereArgs: [id]);
  }

  Future<List<Team>> getTeams() async {
    final db = await instance.database;
    final result = await db.query('teams');
    return result.map((data) => Team.fromMap(data)).toList();
  }
}
