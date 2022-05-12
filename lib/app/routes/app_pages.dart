import 'package:get/get.dart';

import 'package:sqlone/app/modules/add_notes/bindings/add_notes_binding.dart';
import 'package:sqlone/app/modules/add_notes/views/add_notes_view.dart';
import 'package:sqlone/app/modules/edit_notes/bindings/edit_notes_binding.dart';
import 'package:sqlone/app/modules/edit_notes/views/edit_notes_view.dart';
import 'package:sqlone/app/modules/home/bindings/home_binding.dart';
import 'package:sqlone/app/modules/home/views/home_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NOTES,
      page: () => AddNotesView(),
      binding: AddNotesBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_NOTES,
      page: () => EditNotesView(),
      binding: EditNotesBinding(),
    ),
  ];
}
