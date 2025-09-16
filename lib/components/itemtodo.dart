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
}
