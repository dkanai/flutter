import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  testWidgets('should update state when click star icon', (WidgetTester tester) async {
    const MethodChannel('plugins.flutter.io/shared_preferences').setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{};
      }
      return null;
    });

    await tester.pumpWidget(WordScreen());
    await tester.tap(find.byKey(Key("list-icon-0")));

    await tester.pumpWidget(WordScreen());
    expect(find.text("Dog tapped!"), findsOneWidget);
    expect(find.text("Cat"), findsOneWidget);
    await tester.tap(find.byKey(Key("list-icon-0")));

    await tester.pumpWidget(WordScreen());
    expect(find.text("Dog"), findsOneWidget);
    expect(find.text("Cat"), findsOneWidget);
  });
}
