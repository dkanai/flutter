import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/animal/animal.dart';
import 'package:my_app/animal/screen/animals_screen.dart';

import 'test_helper.dart';

void main() {
  setUpAll(() {
    new TestHelper().mockGetSharedPreference([new Animal('Dog'), new Animal('Cat')]);
  });
  testWidgets('should see animal name', (WidgetTester tester) async {
    await tester.pumpWidget(AnimalsScreen());
    await tester.pump();
    expect(find.text('Dog'), findsOneWidget);
    expect(find.text('Cat'), findsOneWidget);
  });
  testWidgets('should update state when click star icon', (WidgetTester tester) async {
    await tester.pumpWidget(AnimalsScreen());
    await tester.pump();
    await tester.tap(find.byKey(Key("list-icon-0")));

    await tester.pump();
    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byIcon(Icons.star_border), findsOneWidget);

    await tester.tap(find.byKey(Key("list-icon-0")));
    await tester.pump();
    expect(find.byIcon(Icons.star), findsNothing);
  });
}
