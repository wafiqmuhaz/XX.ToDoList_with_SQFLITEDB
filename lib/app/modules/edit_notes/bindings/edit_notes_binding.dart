import 'package:get/get.dart';

import '../controllers/edit_notes_controller.dart';

class EditNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditNotesController>(
      () => EditNotesController(),
    );
  }
}
