import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListRender extends StatefulWidget {
  final List<String> todoList;
  const TodoListRender({super.key, required this.todoList});

  @override
  State<TodoListRender> createState() => _TodoListState();
}

class _TodoListState extends State<TodoListRender> {
  void writeLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', widget.todoList);
  }

  void deleteTodoText(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                widget.todoList.removeAt(index);
              });
              writeLocalData();
              Navigator.pop(context);
            },
            child: Text("Task done!"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.check),
                ),
              ],
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              widget.todoList.removeAt(index);
            });
            writeLocalData();
          },
          child: ListTile(
            onTap: () => deleteTodoText(index),
            title: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.check_box_outline_blank,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  Text(widget.todoList[index]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
