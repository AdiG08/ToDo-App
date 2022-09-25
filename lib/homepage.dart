import 'package:flutter/material.dart';
import 'package:to_do/todo_data.dart';
import 'todo_card.dart';
import 'todo_data.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDoData.todoList();
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const Center(
                          child: Image(
                            image: AssetImage('assets/images/Logo.png'),
                            alignment: Alignment.topLeft,
                            height: 100.0,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: const Text(
                            "All Tasks",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (ToDoData toDo in todosList)
                          ToDoCard(
                            todo: toDo,
                            onToDoChanged: markTodo,
                            onDelete: deleteToDo,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 20, right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: todoController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: "Enter new ToDo",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 5),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, right: 10),
                    child: FloatingActionButton(
                      onPressed: () {
                        addToDo(todoController.text);
                      },
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void markTodo(ToDoData todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteToDo(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void addToDo(String toAdd) {
    setState(() {
      todosList.add(
        ToDoData(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toAdd,
        ),
      );
    });
    todoController.clear();
  }
}
