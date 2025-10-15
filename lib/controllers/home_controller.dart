import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_flutter/database_helper.dart';
import 'package:ulangan_flutter/models/todo.dart';

class HomeController extends GetxController {
  final todos = <Todo>[].obs;
  final categories = ['Mendesak', 'Penting', 'Tidak Penting'];

  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }

  final dbHelper = DatabaseHelper.instance;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    try {
      final data = await dbHelper.getTodos();
      todos.assignAll(data.map((e) => Todo.fromJson(e)).toList());
    } catch (e) {
      debugPrint('Error loading todos: $e');
    }
  }

  List<Todo> get activeTodos => todos.where((t) => !t.isDone).toList();
  List<Todo> get completedTodos => todos.where((t) => t.isDone).toList();

  Future<void> addTodo(String title, String desc, int category, String deadline) async {
    if (title.trim().isEmpty) return;

    final todo = Todo(
      title: title.trim(),
      desc: desc.trim(),
      selectedCategory: category,
      deadline: deadline.trim(),
      isDone: false,
    );

    await dbHelper.insertTodo(todo.toJson());
    await loadTodos();
    Get.snackbar('Sukses', 'ToDo berhasil ditambahkan', snackPosition: SnackPosition.TOP);
  }

  Future<void> updateTodoInDB(
    int id,
    String title,
    String desc,
    int category,
    String deadline,
    bool isDone,
  ) async {
    final todo = Todo(
      id: id,
      title: title.trim(),
      desc: desc.trim(),
      selectedCategory: category,
      deadline: deadline.trim(),
      isDone: isDone,
    );

    await dbHelper.updateTodo(id, todo.toJson());
    await loadTodos();
    Get.snackbar('Berhasil', 'Data berhasil diperbarui', snackPosition: SnackPosition.TOP);
  }

  Future<void> toggleTodoStatus(int id, bool newStatus) async {
    try {
      final idx = todos.indexWhere((t) => t.id == id);
      if (idx == -1) return;

      final updated = todos[idx].copyWith(isDone: newStatus);
      await dbHelper.updateTodo(id, updated.toJson());
      await loadTodos();
    } catch (e) {
      debugPrint('Error toggling todo: $e');
    }
  }

  Future<void> deleteTodoFromDB(int id) async {
    await dbHelper.deleteTodo(id);
    await loadTodos();
  }
}