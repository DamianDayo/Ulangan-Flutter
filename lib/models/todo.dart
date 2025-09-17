class Todo {
  String title;
  String desc;
  int selectedCategory;
  bool isDone;
  String deadline;

  Todo({
    required this.title,
    required this.desc,
    this.selectedCategory = 0,
    this.isDone = false,
    this.deadline = "",
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'desc': desc,
        'selectedCategory': selectedCategory,
        'isDone': isDone,
        'deadline': deadline,
      };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json['title'] ?? '',
        desc: json['desc'] ?? '',
        selectedCategory: json['selectedCategory'] ?? 0,
        isDone: json['isDone'] ?? false,
        deadline: json['deadline'] ?? '',
      );
}