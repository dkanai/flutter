import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/todo/todo.dart';
import 'package:my_app/todo/todo_repository.dart';
import 'package:my_app/todo/todos_widget.dart';

void main() {
  testWidgets('no todo', (WidgetTester tester) async {
    await tester.pumpWidget(createWidget(TodosWidget(new FakeTodoRepository([]))));
    expect(find.text('There is no todo'), findsOneWidget);
  });
  testWidgets('there is 1 todo', (WidgetTester tester) async {
    await tester.pumpWidget(createWidget(TodosWidget(new FakeTodoRepository([new Todo('clean toilet')]))));
    expect(find.text('clean toilet'), findsOneWidget);
  });
  testWidgets('there are 2 todo', (WidgetTester tester) async {
    await tester.pumpWidget(createWidget(TodosWidget(new FakeTodoRepository([new Todo('clean toilet'), new Todo('clean room')]))));
    expect(find.text('clean toilet'), findsOneWidget);
    expect(find.text('clean room'), findsOneWidget);
  });
  testWidgets('click complete check box', (WidgetTester tester) async {
    await tester.pumpWidget(createWidget(TodosWidget(new FakeTodoRepository([new Todo('clean toilet'), new Todo('clean room')]))));
    await tester.tap(find.byKey(Key('clean toilet')));
    await tester.pump();
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    await tester.tap(find.byKey(Key('clean toilet')));
    await tester.pump();
    expect(find.byIcon(Icons.check_circle), findsNothing);
  });
}

class FakeTodoRepository implements TodoRepository {
  List<Todo> todos;

  FakeTodoRepository(this.todos);

  @override
  List<Todo> all() {
    return todos;
  }
}

MaterialApp createWidget(TodosWidget todosWidget) => MaterialApp(home: Scaffold(body: todosWidget));
