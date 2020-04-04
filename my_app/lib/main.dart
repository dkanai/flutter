import 'package:flutter/material.dart';
import 'package:my_app/animal.dart';
import 'package:my_app/todo/todo_repository.dart';
import 'package:my_app/todo/todos_widget.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: TodosWidget(new TodoRepository())));
  }
}
