import 'package:flutter/material.dart';

void main() => runApp(TodoApp([]));

class TodoApp extends StatelessWidget {
  List<String> todos;

  TodoApp(this.todos);

  @override
  Widget build(BuildContext context) {
    var widgets;
    if (todos.length == 0) {
      widgets = [Text('There is no todo')];
    } else {
      widgets = todos.map((todo) => Text(todo)).toList();
    }
    return MaterialApp(
        home: ListView(
      children: widgets,
    ));
  }
}
