import 'package:flutter/material.dart';

void main() => runApp(TodoApp(['toilet', 'room']));

class TodoApp extends StatelessWidget {
  List<String> todos;

  TodoApp(this.todos);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: TodosWidget(todos)));
  }
}

class TodosWidget extends StatefulWidget {
  List<String> todos;

  TodosWidget(this.todos);

  @override
  State<StatefulWidget> createState() {
    return TodosState(todos);
  }
}

class TodosState extends State<TodosWidget> {
  List<Todo> _todos;

  TodosState(todos) {
    _todos = todos.map((todo) => new Todo(todo)).toList().cast<Todo>();
  }

  @override
  Widget build(BuildContext context) {
    var widgets;
    if (_todos.length == 0) {
      widgets = [ListTile(title: Text('There is no todo'))];
    } else {
      widgets = _todos
          .map((todo) => ListTile(
              key: Key(todo.title),
              title: Text(todo.title),
              trailing: todo.complete ? Icon(Icons.check_circle, color: Colors.green) : Icon(Icons.check_circle_outline),
              onTap: () {
                setState(() {
                  todo.complete = true;
                });
              }))
          .toList();
    }
    return ListView(
      children: widgets,
    );
  }
}

class Todo {
  String title;
  bool complete = false;

  Todo(this.title);
}
