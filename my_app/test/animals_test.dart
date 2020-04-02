import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/animal/animal.dart';
import 'package:my_app/animal/animals_screen.dart';
import 'package:my_app/main.dart';

void main() {
  setUpAll(() {
    const MethodChannel('plugins.flutter.io/shared_preferences').setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return <String, dynamic>{
          'flutter.animals': jsonEncode([new Animal('Dog'), new Animal('Cat')])
        };
      }
      return null;
    });
  });
  testWidgets('should see animal name', (WidgetTester tester) async {
    await tester.pumpWidget(AnimalsScreen());
    await tester.pumpWidget(AnimalsScreen());
    expect(find.text('Dog'), findsOneWidget);
    expect(find.text('Cat'), findsOneWidget);
  });
  testWidgets('should update state when click star icon', (WidgetTester tester) async {
    await tester.pumpWidget(AnimalsScreen());
    await tester.pumpWidget(AnimalsScreen()); // load storage not wait build. call twice...
    await tester.tap(find.byKey(Key("list-icon-0")));

    await tester.pumpWidget(AnimalsScreen());
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byIcon(Icons.star_border), findsOneWidget);

    await tester.tap(find.byKey(Key("list-icon-0")));
    await tester.pumpWidget(AnimalsScreen());
    expect(find.byIcon(Icons.star), findsNothing);
  });
}
