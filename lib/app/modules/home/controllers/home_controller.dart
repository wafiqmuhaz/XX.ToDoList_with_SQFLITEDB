// ignore_for_file: unnecessary_overrides, unused_import

import 'package:get/get.dart';
import '../../../data/db/db_manager.dart';
import '../../../data/models/notes_model.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  RxList allNotes = [].obs;
  DBManager data = DBManager.instance;

  Future<void> getAllNotes() async {
    Database database = await data.db;
    List<Map<String, dynamic>> datanya = await database.query('notes');

    if (datanya.isNotEmpty) {
      allNotes(Notes.toJsonList(datanya));
      allNotes.refresh();
      // datanya.forEach((element) {
      //   allNotes.add(Notes.fromJson(json))
      // });
    } else {
      allNotes.clear();
      allNotes.refresh();
    }
  }

  Future deleteNotes(int id) async {
    Database database = await data.db;
    await database.delete(
      "notes",
      where: 'id = ?',
      whereArgs: [id],
    );
    await getAllNotes();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllNotes();
    super.onInit();
  }
}
