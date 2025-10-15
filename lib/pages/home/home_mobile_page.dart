import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/home_controller.dart';
import 'package:ulangan_flutter/components/title_text.dart';
import 'package:ulangan_flutter/routes/routes.dart';
import 'package:ulangan_flutter/models/todo.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  String formatDeadline(String rawDeadline) {
    try {
      final parts = rawDeadline.split('-');
      if (parts.length != 3) return rawDeadline;
      final day = int.parse(parts[0]);
      final month = int.parse(parts[1]);
      final year = int.parse(parts[2]);
      const months = [
        '',
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];
      return '$day ${months[month]} $year';
    } catch (e) {
      return rawDeadline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final HomeController c = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 200, 200),
      appBar: AppBar(
        title: const TitleText(
          text: "Home Page",
          fontSize: 30,
          color: Colors.lightBlue,
        ),
      ),
      body: Obx(() {
        final active = c.activeTodos;
        if (active.isEmpty) {
          return const Center(child: Text("Belum ada ToDo yang dibuat"));
        }

        return ListView.builder(
          itemCount: active.length,
          itemBuilder: (context, i) {
            final Todo todo = active[i];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: Checkbox(
                  value: todo.isDone,
                  onChanged: (value) => c.toggleTodoStatus(todo.id!, value ?? false),
                ),
                title: Text(todo.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todo.desc),
                    const SizedBox(height: 4),
                    Text("Kategori: ${c.categories[todo.selectedCategory]}"),
                    const SizedBox(height: 2),
                    Text("Tenggat: ${formatDeadline(todo.deadline)}"),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Get.toNamed(AppRoutes.editTodoPage, arguments: todo.id);
                  },
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodoPage),
        child: const Icon(Icons.add),
      ),
    );
  }
}