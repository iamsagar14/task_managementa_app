import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'task.db';
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "title STRING,note TEXT,date STRING, "
          "startTime STRING,endTime STRING, "
          "remind INTEGER, repete  STRING, "
          "color INTEGER, "
          "isComplected INTEGER )",
        );
      });
    } catch (e) {
      print('this is the error$e');
    }
  }

  static Future<int> insert(Task? task) async {
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }

  static delete(Task? task) async {
    await _db!.delete(_tableName, where: 'id=?', whereArgs: [task!.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate(''' 
    UPDATE tasks 
    SET isComplected = ?
    WHERE id = ?
    ''', [1, id]);
  }
}
