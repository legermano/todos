import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todos/store/todo_list.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);
    final _scrollController = ScrollController();

    return Observer(
      builder: (_) => Flexible(
        child: CupertinoScrollbar(
          controller: _scrollController,          
          child: ListView.builder(
            controller: _scrollController,     
            itemCount: list.visibleTodos.length,
            itemBuilder: (_, index) {
              final todo = list.visibleTodos[index];
              
              return Observer(
                builder: (_) => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: todo.done, 
                  onChanged: (flag) => todo.done = flag,
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          todo.description,
                          overflow: TextOverflow.ellipsis,
                        )
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete), 
                        onPressed: () => list.removeTodo(todo)
                      )
                    ],
                  ),
                )
              );
            }
          )
        )
      ),
    );
  }
}