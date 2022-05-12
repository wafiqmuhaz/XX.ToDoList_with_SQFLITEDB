// ignore_for_file: unnecessary_overrides, unused_import

import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../../../data/db/db_manager.dart';

class AddNotesController extends GetxController {
  RxBool isLoad = false.obs;
  DBManager database = DBManager.instance;

  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  void addnotes() async {
    if (titleC.text.isNotEmpty && descC.text.isNotEmpty) {
      isLoad.value = true;
      Database db = await database.db;
      await db.insert(
        'notes',
        {
          // "id": Random().nextInt(256),
          "title": titleC.text,
          "desc": descC.text,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      isLoad.value = true;
    }
  }
}
