class Todo {
  int? id;
  String title;
  String desc;
  int selectedCategory;
  bool isDone;
  String deadline;

  Todo({
    this.id,
    required this.title,
    required this.desc,
    this.selectedCategory = 0,
    this.isDone = false,
    this.deadline = "",
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': desc,
        'category': selectedCategory,
        'isDone': isDone ? 1 : 0,
        'deadline': deadline,
      };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'] ?? '',
        desc: json['description'] ?? '',
        selectedCategory: json['category'] ?? 0,
        isDone: (json['isDone'] ?? 0) == 1,
        deadline: json['deadline'] ?? '',
      );

  Todo copyWith({
    int? id,
    String? title,
    String? desc,
    int? selectedCategory,
    bool? isDone,
    String? deadline,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      isDone: isDone ?? this.isDone,
      deadline: deadline ?? this.deadline,
    );
  }
}