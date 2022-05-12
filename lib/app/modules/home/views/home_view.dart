// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqlone/app/routes/app_pages.dart';
import '../../../data/models/notes_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL NOTES'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.offAllNamed(
              Routes.HOME,
            ),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
              future: controller.getAllNotes(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Obx(
                  () => (controller.allNotes.length == 0)
                      ? Center(
                          child: Text("tidak ada data"),
                        )
                      : ListView.builder(
                          itemCount: controller.allNotes.length,
                          itemBuilder: (context, index) {
                            Notes note = controller.allNotes[index];
                            return Card(
                              color: Colors.blue[100],
                              child: ListTile(
                                onTap: () => Get.toNamed(
                                  Routes.EDIT_NOTES,
                                  arguments: note,
                                ),
                                leading: CircleAvatar(
                                  child: Text('${note.id}'),
                                ),
                                title: Text('${note.title}'),
                                subtitle: Text('${note.desc}'),
                                trailing: IconButton(
                                  onPressed: () =>
                                      controller.deleteNotes(note.id!),
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(
            Routes.ADD_NOTES,
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
