import 'package:my_app/todo/todo.dart';

class TodoRepository {
  List<Todo> all() {
    return [new Todo('dummy toilet'), new Todo('dummy room')];
  }
}
