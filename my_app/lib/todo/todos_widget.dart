import 'package:flutter/material.dart';
import 'package:my_app/todo/todo.dart';
import 'package:my_app/todo/todo_repository.dart';

class TodosWidget extends StatefulWidget {
  TodoRepository todoRepository;

  TodosWidget(this.todoRepository);

  @override
  State<StatefulWidget> createState() {
    return TodosState(todoRepository);
  }
}

class TodosState extends State<TodosWidget> {
  List<Todo> _todos;
  TodoRepository todoRepository;

  TodosState(this.todoRepository);

  @override
  void initState() {
    _todos = todoRepository.all();
  }

  @override
  Widget build(BuildContext context) {
    if (_todos.length == 0) return Text('There is no todo');
    return ListView(
      children: _todos.map((todo) => listTile(todo)).toList() +
          [
            RaisedButton(
                child: Text("add new todo"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) {
                    return NewTodoScreen();
                  }));
                })
          ],
    );
  }

  Widget listTile(Todo todo) {
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

class NewTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Todo")),
      body: TodoForm(),
    );
  }
}

class TodoForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoFormState();
  }
}

class TodoFormState extends State<TodoForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "title"),
          )
        ],
      ),
    );
  }
}
