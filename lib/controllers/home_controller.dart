import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ulangan_flutter/models/todo.dart';

class HomeController extends GetxController {
  final GetStorage storage = GetStorage();
  final todos = <Todo>[].obs;

  final categories = ['Mendesak', 'Penting', 'Tidak Penting'];

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  List<Todo> get activeTodos => todos.where((t) => !t.isDone).toList();

  List<Todo> get completedTodos => todos.where((t) => t.isDone).toList();

  void addTodo(String title, String desc, int category, String deadline) {
    if (title.trim().isEmpty) return;
    todos.add(Todo(
      title: title.trim(),
      desc: desc.trim(),
      selectedCategory: category,
      deadline: deadline,
    ));
    saveTodos();
  }

  void updateTodo(int index, String title, String desc, int category, String deadline) {
    if (index < 0 || index >= todos.length) return;
    todos[index].title = title.trim();
    todos[index].desc = desc.trim();
    todos[index].selectedCategory = category;
    todos[index].deadline = deadline;
    todos.refresh();
    saveTodos();
  }

  void deleteTodo(int index) {
    if (index < 0 || index >= todos.length) return;
    todos.removeAt(index);
    saveTodos();
  }

  void toggleTodoStatus(int index) {
    if (index < 0 || index >= todos.length) return;
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
    saveTodos();
  }

  Future<void> saveTodos() async {
    final list = todos.map((t) => t.toJson()).toList();
    await storage.write('todos', list);
  }

  void loadTodos() {
    final raw = storage.read('todos');
    if (raw == null) return;

    try {
      final loaded = (raw as List)
          .map<Todo>((item) => Todo.fromJson(Map<String, dynamic>.from(item)))
          .toList();
      todos.value = loaded;
    } catch (e) {
      todos.clear();
      print('Error loading todos: $e');
    }
  }
}