import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';
import 'package:ulangan_flutter/controllers/login_controller.dart';
import 'package:ulangan_flutter/controllers/todo_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(TodoController(), permanent: true); 
  }
}