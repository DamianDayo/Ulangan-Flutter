import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';

class AddTodoController extends GetxController {
  final HomeController home = Get.find();
  
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final deadlineController = TextEditingController();
  final selectedCategory = 0.obs;

  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  void addTodo() {
    final title = titleController.text.trim();
    final desc = descController.text.trim();
    final deadline = deadlineController.text.trim();
    final cat = selectedCategory.value;

    if (title.isEmpty || desc.isEmpty || deadline.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field harus diisi',
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    home.addTodo(title, desc, cat, deadline);
    Get.back();
    Get.snackbar(
      'Sukses',
      'ToDo berhasil ditambahkan',
      snackPosition: SnackPosition.TOP,
    );
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    deadlineController.dispose();
    super.onClose();
  }
}