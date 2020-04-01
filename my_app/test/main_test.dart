import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
//  testWidgets('main screen smoke', (WidgetTester tester) async {
//    await tester.pumpWidget(MainScreen());
//    expect(find.text('Startup Name Generator'), findsOneWidget);
//  });

  testWidgets('should see animal name', (WidgetTester tester) async {
    await tester.pumpWidget(WordScreen());
    expect(find.text('Dog'), findsOneWidget);
    expect(find.text('Cat'), findsOneWidget);
  });
//  testWidgets('should update state when click star icon', (WidgetTester tester) async {
//    await tester.pumpWidget(WordScreen());
//    await tester.tap(find.byIcon(Icons.star));
//    expect(tester.allStates.first, true);
//  });
}


