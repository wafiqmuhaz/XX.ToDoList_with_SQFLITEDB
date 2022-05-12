// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class EditNotesController extends GetxController {
  RxBool isLoad = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  DBManager database = DBManager.instance;

  void editNotes(int id) async {
    Database db = await database.db;
    await db.update(
      "notes",
      {
        "id": id,
        "title": titleC.text,
        "desc": descC.text,
      },
      where: "id = ?",
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
