import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';
import 'package:ulangan_flutter/models/todo.dart';

class HistoryController extends GetxController {
  final HomeController homeController = Get.find();
  RxList<Todo> completed = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();

    completed.value = homeController.completedTodos;

    ever(homeController.todos, (_) {
      completed.value = homeController.completedTodos;
    });
  }

  void toggleTodoStatus(int indexInAll) {
    homeController.toggleTodoStatus(indexInAll);
  }

  void deleteTodo(int indexInAll) {
    homeController.deleteTodo(indexInAll);
  }
}