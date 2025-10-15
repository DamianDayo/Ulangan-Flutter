import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/history_controller.dart';

class HistoryWidescreenPage extends StatelessWidget {
  const HistoryWidescreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryController c = Get.put(HistoryController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 200, 200),
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(
            fontSize: 30,
            color: Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Obx(() {
          final completed = c.completed;
          if (completed.isEmpty) {
            return const Center(
              child: Text(
                "Belum ada ToDo selesai",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            );
          }

          return ListView.separated(
            itemCount: completed.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final todo = completed[index];

              return ListTile(
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (_) => c.toggleTodoStatus(todo),
                ),
                title: Text(
                  todo.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "${todo.desc}\nTenggat: ${todo.deadline}",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => c.deleteTodo(todo),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}