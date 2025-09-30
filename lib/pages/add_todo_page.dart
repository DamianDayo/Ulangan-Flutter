import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/add_todo_controller.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  String _monthName(int month) {
    const names = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    return names[month];
  }

  @override
  Widget build(BuildContext context) {
    final AddTodoController c = Get.find();
    final HomeController homeController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Tambah ToDo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: c.titleController,
              decoration: const InputDecoration(labelText: "Judul"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: c.descController,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  final formatted =
                      "${picked.day}-${_monthName(picked.month)}-${picked.year}";
                  c.deadlineController.text = formatted;
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: c.deadlineController,
                  decoration: const InputDecoration(labelText: "Tenggat"),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() => DropdownButton<int>(
                  value: c.selectedCategory.value,
                  items: List.generate(
                    homeController.categories.length,
                    (i) => DropdownMenuItem(
                      value: i,
                      child: Text(homeController.categories[i]),
                    ),
                  ),
                  onChanged: (val) => c.selectedCategory.value = val ?? 0,
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: c.addTodo,
              child: const Text("Tambah"),
            ),
          ],
        ),
      ),
    );
  }
}