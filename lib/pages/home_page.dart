import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/todo_controller.dart';
import 'package:ulangan_flutter/pages/add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Obx(() {
        if (todoController.todos.isEmpty) {
          return const Center(child: Text('Belum ada todo'));
        }

        return ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final t = todoController.todos[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(t.title),
                subtitle: Text(
                  '${t.descC}\nKategori: ${todoController.categories[t.selectedCategory]}',
                ),
                isThreeLine: true,
                leading: Checkbox(
                  value: t.isDone,
                  onChanged: (_) => todoController.toggleDone(index),
                ),
                trailing: PopupMenuButton<int>(
                  onSelected: (val) {
                    if (val == 0) {
                      Get.to(() => AddTodoPage(editIndex: index));
                    } else if (val == 1) {
                      todoController.deleteTodo(index);
                    }
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 0, child: Text('Edit')),
                    PopupMenuItem(value: 1, child: Text('Hapus')),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddTodoPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
