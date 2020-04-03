import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/animal/animal.dart';
import 'package:my_app/animal/animal_repository.dart';
import 'package:my_app/animal/widget/animals_widget.dart';

import 'test_helper.dart';

void main() {
  testWidgets('no animal', (WidgetTester tester) async {
    var fakeAnimalRepository = new FakeAnimalRepository([]);
    await tester.pumpWidget(new TestHelper().createWithMaterialScaffold(AnimalsWidget(fakeAnimalRepository)));
    await tester.pump();
    expect(find.text('There is no animal'), findsOneWidget);
  });
  testWidgets('should see animal name', (WidgetTester tester) async {
    var fakeAnimalRepository = new FakeAnimalRepository([new Animal('Dog'), new Animal('Cat')]);
    await tester.pumpWidget(new TestHelper().createWithMaterialScaffold(AnimalsWidget(fakeAnimalRepository)));
    await tester.pump();
    expect(find.text('Dog'), findsOneWidget);
    expect(find.text('Cat'), findsOneWidget);
  });
  testWidgets('should update state when click star icon', (WidgetTester tester) async {
    var fakeAnimalRepository = new FakeAnimalRepository([new Animal('Dog'), new Animal('Cat')]);
    await tester.pumpWidget(new TestHelper().createWithMaterialScaffold(AnimalsWidget(fakeAnimalRepository)));
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

class FakeAnimalRepository implements AnimalRepository {
  @override
  String key;

  List<Animal> animals;

  FakeAnimalRepository(this.animals);

  @override
  void add(Animal animal) {}

  @override
  Future<List> load() async {
    return animals;
  }

  @override
  void update(List<Animal> animals) {}
}
