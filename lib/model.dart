class Test {
  String? id;
  String? todoText;
  bool isDone;
  Test({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Test> todoList() {
    return [];
  }
}
