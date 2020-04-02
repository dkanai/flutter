import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  setUpAll(() {
    const MethodChannel('plugins.flutter.io/shared_preferences').setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{
          'flutter.animals': jsonEncode([new AnimalCard('Dog'), new AnimalCard('Cat')])
        };
      }
      return null;
    });
  });
  testWidgets('should see animal name', (WidgetTester tester) async {
    await tester.pumpWidget(WordScreen());
    await tester.pumpWidget(WordScreen());
    expect(find.text('Dog'), findsOneWidget);
    expect(find.text('Cat'), findsOneWidget);
  });
  testWidgets('should update state when click star icon', (WidgetTester tester) async {
    await tester.pumpWidget(WordScreen());
    await tester.pumpWidget(WordScreen()); // loadStorge not wait build. call twice...
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
