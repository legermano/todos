import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/store/todo_list.dart';

class AddTodo extends StatelessWidget {
  final _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return TextField(
      controller: _textController,
      autofocus: true,
      decoration: const InputDecoration(
        labelText: 'Add a Todo',
        contentPadding: EdgeInsets.all(8)
      ),
      onChanged: (String newValue) {
        list.currentDescription = newValue;
      },
      onSubmitted: (String value) {
        if (value.isNotEmpty) {
          list.addTodo(value);
          _textController.clear();          
        }        
      },
    );
  }
}