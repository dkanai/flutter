import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('no todo', (WidgetTester tester) async {
    await tester.pumpWidget(TodoApp([]));
    expect(find.text('There is no todo'), findsOneWidget);
  });
  testWidgets('there is 1 todo', (WidgetTester tester) async {
    await tester.pumpWidget(TodoApp(['clean toilet']));
    expect(find.text('clean toilet'), findsOneWidget);
  });
  testWidgets('there are 2 todo', (WidgetTester tester) async {
    await tester.pumpWidget(TodoApp(['clean toilet', 'clean room']));
    expect(find.text('clean toilet'), findsOneWidget);
    expect(find.text('clean room'), findsOneWidget);
  });
}
