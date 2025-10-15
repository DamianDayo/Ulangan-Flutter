import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';

class EditTodoController extends GetxController {
  final HomeController home = Get.find();

  late int index;
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final deadlineController = TextEditingController();
  final selectedCategory = 0.obs;
  
  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  @override
  void onInit() {
    super.onInit();
    index = Get.arguments as int;
    final todo = home.todos[index];
    titleController.text = todo.title;
    descController.text = todo.desc;
    selectedCategory.value = todo.selectedCategory;
    deadlineController.text = todo.deadline;
  }

  Future<void> pickDeadline(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final monthNames = [
        '', 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
        'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
      ];
      final formatted =
          "${picked.day.toString().padLeft(2, '0')}-${monthNames[picked.month]}-${picked.year}";
      deadlineController.text = formatted;
    }
  }

  void saveTodo() {
    final title = titleController.text.trim();
    final desc = descController.text.trim();
    final cat = selectedCategory.value;
    final dl = deadlineController.text.trim();

    if (title.isEmpty || desc.isEmpty || dl.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi!', snackPosition: SnackPosition.TOP);
      return;
    }

    final todo = home.todos[index];
    home.updateTodoInDB(todo.id!, title, desc, cat, dl, todo.isDone);

    Get.back();
    Get.snackbar('Sukses', 'ToDo berhasil disimpan', snackPosition: SnackPosition.TOP);
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    deadlineController.dispose();
    super.onClose();
  }
}