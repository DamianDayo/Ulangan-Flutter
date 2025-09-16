import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/todo_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Histori")),
      body: Obx(() {
        final completed = todoController.completedTodos;
        if (completed.isEmpty) {
          return const Center(child: Text("Belum ada todo selesai"));
        }
        return ListView.builder(
          itemCount: completed.length,
          itemBuilder: (context, index) {
            final todo = completed[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.descC),
            );
          },
        );
      }),
    );
  }
}
