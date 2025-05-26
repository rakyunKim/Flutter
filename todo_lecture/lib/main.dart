import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_lecture/mainscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(initialTodoList: await loadData()));
}

Future<List<String>> loadData() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('todoList') ?? [];
}

class MyApp extends StatelessWidget {
  final List<String> initialTodoList;
  const MyApp({super.key, required this.initialTodoList});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: MainScreen(initialTodoList: initialTodoList),
    );
  }
}
