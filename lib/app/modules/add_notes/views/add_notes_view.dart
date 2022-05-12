// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';

import '../controllers/add_notes_controller.dart';

class AddNotesView extends GetView<AddNotesController> {
  final HomeController HomeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddNotesView'),
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
                        controller.addnotes();
                        await HomeC.getAllNotes();
                        Get.back();
                      }
                    },
                    child: Text(
                      controller.isLoad.isFalse ? 'ADD DATA' : 'LOADING...',
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
