import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/todo_controller.dart';

class EditTodoController extends GetxController {
  final TodoController todoController = Get.find();

  late TextEditingController titleController;
  late TextEditingController descCController;
  late TextEditingController selectedController;

  late int index;

  @override
  void onInit() {
    super.onInit();

    index = Get.arguments;
    final todo = todoController.todos[index];

    titleController = TextEditingController(text: todo.title);
    descCController = TextEditingController(text: todo.descC);
    selectedController = TextEditingController(
      text: todo.selectedCategory.toString(),
    );
  }

  void saveTodo() {
    final parsedNumber = int.tryParse(selectedController.text) ?? 0;

    todoController.updateTodo(
      index,
      titleController.text.trim(),
      descCController.text.trim(),
      parsedNumber,
    );

    Get.back();
    Get.snackbar(
      "Sukses",
      "Data telah diperbarui",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void onClose() {
    titleController.dispose();
    descCController.dispose();
    selectedController.dispose();
    super.onClose();
  }
}
