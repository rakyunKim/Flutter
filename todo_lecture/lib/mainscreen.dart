import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_lecture/add_task.dart';

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

  void addTodo({required String todoText}){
    if (todoText != "")
    {
      setState(() {
        todoList.insert(0, todoText);
      });
      writeLocalData();
      Navigator.pop(context);
    }
  }

  void writeLocalData() async{
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('todoList', todoList);
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
        actions: [
          IconButton(
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
                        child: AddTask(addTodo: addTodo,),
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              showModalBottomSheet(
                context: context,
                builder: (context){
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          todoList.removeAt(index);
                        });
                        writeLocalData();
                        Navigator.pop(context);
                      },
                      child: Text("Task done!"),
                    ),
                  );
                },
              );
            },
            title: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.check_box_outline_blank,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  Text(todoList[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
