import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  final void Function({required String todoText}) addTodo;
  const AddTask({super.key, required this.addTodo});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
var todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add task"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: todoText,
            decoration: InputDecoration(
              hintText: "Add task",
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.addTodo(todoText: todoText.text);
            todoText.clear();
          },
          child: Text("add"),
        ),
      ],
    );
  }
}
