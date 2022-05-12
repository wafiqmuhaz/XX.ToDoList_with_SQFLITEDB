import 'package:get/get.dart';

import '../controllers/add_notes_controller.dart';

class AddNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddNotesController>(
      () => AddNotesController(),
    );
  }
}
