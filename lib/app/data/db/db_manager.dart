// ignore_for_file: unused_import, unused_field, prefer_conditional_assignment, recursive_getters

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  // private constructor
  DBManager._privCons();
  static DBManager instance = DBManager._privCons();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDB();
      return _db!;
    } else {
      return _db!;
    }
  }

  Future _initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();

    String path = join(docDir.path, "notes.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        return await db.execute(
          '''
            CREATE TABLE notes (
              id INTEGER PRIMARY KEY,
              title TEXT NOT NULL,
              desc TEXT NOT NULL
            )
          ''',
        );
      },
    );
  }

  Future closeDB() async {
    _db = await instance.db;
    _db!.close();
  }
}
