import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ulangan_flutter/components/itemtodo.dart'; // or wherever your Todo model is

// If you already have Todo in itemtodo.dart, ensure it has toJson/fromJson.
// Example standalone Todo model if needed:
class Todo {
  String title;
  String descC;
  int selectedCategory;
  bool isDone;

  Todo({
    required this.title,
    required this.descC,
    this.selectedCategory = 0,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'descC': descC,
    'selectedCategory': selectedCategory,
    'isDone': isDone,
  };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    title: json['title'] ?? '',
    descC: json['descC'] ?? '',
    selectedCategory: (json['selectedCategory'] is int)
        ? json['selectedCategory'] as int
        : int.tryParse('${json['selectedCategory']}') ?? 0,
    isDone: json['isDone'] == true,
  );
}

class TodoController extends GetxController {
  final GetStorage storage = GetStorage();
  final todos = <Todo>[].obs;

  final categories = ['Mendesak', 'Penting', 'Tidak Penting'];

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  void addTodo(String title, String desc, int category) {
    if (title.trim().isEmpty) return;
    todos.add(
      Todo(title: title.trim(), descC: desc.trim(), selectedCategory: category),
    );
    saveTodos();
  }

  void updateTodo(int index, String title, String desc, int category) {
    if (index < 0 || index >= todos.length) return;
    todos[index].title = title.trim();
    todos[index].descC = desc.trim();
    todos[index].selectedCategory = category;
    todos.refresh();
    saveTodos();
  }

  void deleteTodo(int index) {
    if (index < 0 || index >= todos.length) return;
    todos.removeAt(index);
    saveTodos();
  }

  void toggleDone(int index) {
    if (index < 0 || index >= todos.length) return;
    todos[index].isDone = !todos[index].isDone;
    todos.refresh();
    saveTodos();
  }

  void clearCompleted() {
    todos.removeWhere((t) => t.isDone);
    saveTodos();
  }

  List<Todo> get completedTodos => todos.where((t) => t.isDone).toList();

  Future<void> saveTodos() async {
    final list = todos.map((t) => t.toJson()).toList();
    await storage.write('todos', list);
  }

  void loadTodos() {
    final raw = storage.read('todos');
    if (raw == null) {
      todos.clear();
      return;
    }

    try {
      if (raw is List) {
        final loaded = raw.map<Todo>((item) {
          if (item is Map) {
            final map = Map<String, dynamic>.from(item);
            return Todo.fromJson(map);
          }
          if (item is String) {
            final Map<String, dynamic> map = jsonDecode(item);
            return Todo.fromJson(map);
          }
          throw FormatException(
            'Unsupported todo item type: ${item.runtimeType}',
          );
        }).toList();

        todos.value = loaded;
        return;
      }

      if (raw is String) {
        final decoded = jsonDecode(raw);
        if (decoded is List) {
          todos.value = decoded
              .map<Todo>((e) => Todo.fromJson(Map<String, dynamic>.from(e)))
              .toList();
          return;
        }
      }

      todos.clear();
    } catch (e, st) {
      print('Error loading todos from storage: $e\n$st');
      todos.clear();
    }
  }
}
