import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/main_menu_controller.dart';

class MainMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainMenuController>(() => MainMenuController());
  }
}