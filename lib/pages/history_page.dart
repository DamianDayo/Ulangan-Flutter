import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/history_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController c = Get.put(HistoryController());

    return Scaffold(
      appBar: AppBar(title: const Text("Histori")),
      body: Obx(() {
        final completed = c.completed;
        if (completed.isEmpty) {
          return const Center(child: Text("Belum ada ToDo selesai"));
        }

        return ListView.builder(
          itemCount: completed.length,
          itemBuilder: (context, index) {
            final todo = completed[index];
            final indexInAll = c.homeController.todos.indexOf(todo);

            return ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (_) {
                  if (indexInAll != -1) {
                    c.toggleTodoStatus(indexInAll);
                  }
                },
              ),
              title: Text(todo.title),
              subtitle: Text("${todo.desc}\nTenggat: ${todo.deadline}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  if (indexInAll != -1) {
                    c.deleteTodo(indexInAll);
                  }
                },
              ),
            );
          },
        );
      }),
    );
  }
}