import 'package:flutter/material.dart';
import 'package:my_app/todo/todo.dart';

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
    if (_todos.length == 0) return Text('There is no todo');
    return ListView(
      children: _todos.map((todo) => listTile(todo)).toList(),
    );
  }

  ListTile listTile(Todo todo) {
    return ListTile(
        key: Key(todo.title),
        title: Text(todo.title),
        trailing: icon(todo),
        onTap: () {
          setState(() {
            todo.complete = !todo.complete;
          });
        });
  }

  Icon icon(Todo todo) => todo.complete ? Icon(Icons.check_circle, color: Colors.green) : Icon(Icons.check_circle_outline);
}
