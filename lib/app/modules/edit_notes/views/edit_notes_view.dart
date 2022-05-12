// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqlone/app/modules/home/controllers/home_controller.dart';

import '../controllers/edit_notes_controller.dart';
import '../../../data/models/notes_model.dart';

class EditNotesView extends GetView<EditNotesController> {
  Notes note = Get.arguments;
  final HomeController HomeC = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.titleC.text = note.title!;
    controller.descC.text = note.desc!;
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT NOTES'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.titleC,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "item",
                hintText: "Masukkan item anda!",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.descC,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "deskripsi",
                hintText: "Masukkan deskripsi anda!",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(
              (() => ElevatedButton(
                    onPressed: () async {
                      if (controller.isLoad.isFalse) {
                        controller.editNotes(note.id!);
                        await HomeC.getAllNotes();
                        Get.back();
                      }
                    },
                    child: Text(
                      controller.isLoad.isFalse ? 'EDIT DATA' : 'LOADING...',
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
