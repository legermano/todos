import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/store/todo_list.dart';
import 'package:todos/widgets/action_bar.dart';
import 'package:todos/widgets/add_todo.dart';
import 'package:todos/widgets/description.dart';
import 'package:todos/widgets/todo_listview.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: TodoExample()
    );
  }
}

class TodoExample extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Provider<TodoList>(
    create: (_) => TodoList(),
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Column(
        children: <Widget>[
          AddTodo(),
          ActionBar(),
          Description(),
          TodoListView()
        ],
      ),
    ),
  );
}
