import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/animal/animal.dart';
import 'package:my_app/animal/animals_screen.dart';
import 'package:my_app/animal/new_animal_screen.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(NewAnimalScreen());
    expect(find.text('New'), findsOneWidget);
  });
}
