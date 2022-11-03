import 'package:sqflite/sqflite.dart';

import '../../model/restourant_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblFavorite = 'favorites';

  Future<Database> _initialDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase('$path/restaurant.db', onCreate: (db, version) async {
      await db.execute(''' CREATE TABLE $_tblFavorite (
          id TEXT PRIMARY KEY,
          name TEXT,
          description TEXT,
          pictureId TEXT,
          city TEXT,
          rating FLOAT
        )
''');
    }, version: 1);
    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initialDb();
    return _database;
  }

  Future<void> insertFavorite(Restaurants restaurants) async {
    final db = await database;
    await db?.insert(_tblFavorite, restaurants.toJson());
  }

  Future<List<Restaurants>> getFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblFavorite);

    return results.map((res) => Restaurants.fromJson(res)).toList();
  }

  Future<Map> getFavoriteById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;

    await db!.delete(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
