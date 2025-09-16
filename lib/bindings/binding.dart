import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/todo_controller.dart';
import 'package:ulangan_flutter/controllers/main_menu_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TodoController(), permanent: true);
    Get.put(MainMenuController(), permanent: true);
  }
}
