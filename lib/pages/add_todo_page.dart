import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/controllers/todo_controller.dart';

class AddTodoPage extends StatefulWidget {
  final int? editIndex;

  const AddTodoPage({Key? key, this.editIndex}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TodoController todoController = Get.find<TodoController>();

  late TextEditingController titleC;
  late TextEditingController descC;
  int selectedCategory = 0;

  @override
  void initState() {
    super.initState();

    if (widget.editIndex != null) {
      final t = todoController.todos[widget.editIndex!];
      titleC = TextEditingController(text: t.title);
      descC = TextEditingController(text: t.descC);
      selectedCategory = t.selectedCategory;
    } else {
      titleC = TextEditingController();
      descC = TextEditingController();
    }
  }

  void saveTodo() {
    if (widget.editIndex != null) {
      todoController.updateTodo(
        widget.editIndex!,
        titleC.text.trim(),
        descC.text.trim(),
        selectedCategory,
      );
    } else {
      todoController.addTodo(
        titleC.text.trim(),
        descC.text.trim(),
        selectedCategory,
      );
    }

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editIndex != null ? "Edit Todo" : "Tambah Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleC,
              decoration: const InputDecoration(labelText: "Judul"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descC,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),
            const SizedBox(height: 12),
            DropdownButton<int>(
              value: selectedCategory,
              items: List.generate(
                todoController.categories.length,
                (i) => DropdownMenuItem(
                  value: i,
                  child: Text(todoController.categories[i]),
                ),
              ),
              onChanged: (val) => setState(() => selectedCategory = val ?? 0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveTodo,
              child: Text(
                widget.editIndex != null ? "Simpan Perubahan" : "Tambah",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
