import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/edit_todo_controller.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EditTodoController c = Get.find();
    final HomeController home = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Edit ToDo")),
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
              onTap: () => c.pickDeadline(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: c.deadlineController,
                  decoration: const InputDecoration(
                    labelText: "Tenggat",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_month),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() => DropdownButton<int>(
                  value: c.selectedCategory.value,
                  items: List.generate(
                    home.categories.length,
                    (i) => DropdownMenuItem(
                      value: i,
                      child: Text(home.categories[i]),
                    ),
                  ),
                  onChanged: (val) => c.selectedCategory.value = val ?? 0,
                )),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: c.saveTodo, child: const Text("Simpan")),
          ],
        ),
      ),
    );
  }
}