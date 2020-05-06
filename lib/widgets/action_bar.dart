import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todos/store/todo_list.dart';

class ActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);

    return Column(
      children: <Widget>[
        Observer(
          builder: (_) {
            final selections = VisibilityFilter.values
              .map((f) => f == list.filter)
              .toList(growable: false);

            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(8),
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: const Text('All')
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: const Text('Pending')
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: const Text('Completed')
                      )
                    ],
                    onPressed: (index) {
                      list.filter = VisibilityFilter.values[index];
                    }, 
                    isSelected: selections
                  ),
                )
              ],
            );  
          }
        ),
        Observer(
          builder: (_) => ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: const Text('Remove Completed'),
                onPressed: list.canRemoveAllCompleted
                  ? list.removeCompleted
                  : null,
              ),
              RaisedButton(
                child: const Text('Mark All Completed'),
                onPressed: list.canMarkAllCompleted
                  ? list.markAllAsCompleted
                  : null
              )
            ],
          ),
        )
      ],
    );
  }
}