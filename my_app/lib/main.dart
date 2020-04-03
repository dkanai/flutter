import 'package:flutter/material.dart';
import 'package:my_app/todo/todos_widget.dart';

void main() => runApp(TodoApp(['toilet', 'room']));

class TodoApp extends StatelessWidget {
  List<String> todos;

  TodoApp(this.todos);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: TodosWidget(todos)));
  }
}
