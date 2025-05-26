import 'package:flutter/material.dart';
import 'package:todo_lecture/add_task.dart';
import 'package:todo_lecture/todo_list_render.dart';

class MainScreen extends StatefulWidget {
  final List<String> initialTodoList;
  const MainScreen({super.key, required this.initialTodoList});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];
  @override
  void initState() {
    super.initState();
    todoList = [...widget.initialTodoList];
  }

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Already exists"),
            content: Text("This task is already exists"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );
      return;
    }
    if (todoText != "") {
      setState(() {
        todoList.insert(0, todoText);
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      drawer: Drawer(child: Text("Drawer")),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("TODO APP"),
        centerTitle: true,
      ),
      body: (todoList.isEmpty)
          ? Center(
              child: Text(
                "No Items on the list",
                style: TextStyle(fontSize: 20),
              ),
            )
          : TodoListRender(todoList: todoList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: SizedBox(
                    height: 400,
                    child: AddTask(addTodo: addTodo),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
