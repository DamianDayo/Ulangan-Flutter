import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';
import 'package:ulangan_flutter/models/todo.dart';

class HistoryController extends GetxController {
  final HomeController homeController = Get.find();
  RxList<Todo> completed = <Todo>[].obs;

  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  @override
  void onInit() {
    super.onInit();
    completed.value = homeController.completedTodos;

    ever(homeController.todos, (_) {
      completed.value = homeController.completedTodos;
    });
  }

  void toggleTodoStatus(Todo todo) async {
    final newStatus = !todo.isDone;
    await homeController.toggleTodoStatus(todo.id!, newStatus);
  }

  void deleteTodo(Todo todo) async {
    await homeController.deleteTodoFromDB(todo.id!);
  }
}