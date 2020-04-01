import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/counter.dart';

import 'package:my_app/main.dart';

void main() {
  testWidgets('main screen smoke', (WidgetTester tester) async {
    await tester.pumpWidget(MainScreen());
    expect(find.text('Startup Name Generator'), findsOneWidget);
  });
}
