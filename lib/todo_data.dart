class ToDoData {
  String? id;
  String? todoText;
  bool isDone;
  ToDoData({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDoData> todoList() {
    return [
      ToDoData(id: '01', todoText: 'Morning Excercise', isDone: true),
      ToDoData(id: '02', todoText: 'Buy Groceries', isDone: true),
      ToDoData(id: '03', todoText: 'Check Emails'),
    ];
  }
}
