import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/animal/new_animal_screen.dart';

Widget create(child) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  testWidgets('submit new animal', (WidgetTester tester) async {
    await tester.pumpWidget(create(NewAnimalScreen()));
    await tester.enterText(find.byType(TextField), 'Big Dog');
    expect(find.text('Big Dog'), findsOneWidget);
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();
    expect(find.text('Success'), findsOneWidget);
  });
  testWidgets('vaidate empty name', (WidgetTester tester) async {
    await tester.pumpWidget(create(NewAnimalScreen()));
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();
    expect(find.text('Please enter some text'), findsOneWidget);
  });
}
