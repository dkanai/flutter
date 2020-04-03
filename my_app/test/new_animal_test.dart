import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/animal/animal.dart';
import 'package:my_app/animal/widget/animal_form.dart';
import 'package:my_app/animal/animal_repository.dart';
import 'package:my_app/animal/screen/new_animal_screen.dart';

import 'test_helper.dart';

void main() {
  testWidgets('submit new animal', (WidgetTester tester) async {
    var fakeAnimalRepository = new FakeAnimalRepository();
    await tester.pumpWidget(new TestHelper().createWithMaterialScaffold(AnimalForm(fakeAnimalRepository)));
    await tester.enterText(find.byType(TextField), 'Big Dog');
    await tester.tap(find.byType(Checkbox));
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();
    expect(find.text('Success'), findsOneWidget);
    expect(fakeAnimalRepository.callOnceAdd, true);
    expect(fakeAnimalRepository.animal.name, 'Big Dog');
    expect(fakeAnimalRepository.animal.favorite, true);
  });
  testWidgets('vaidate empty name', (WidgetTester tester) async {
    await tester.pumpWidget(new TestHelper().createWithMaterial(NewAnimalScreen()));
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();
    expect(find.text('Please enter some text'), findsOneWidget);
  });
}

class FakeAnimalRepository implements AnimalRepository {
  @override
  String key;
  bool callOnceAdd = false;
  Animal animal;

  @override
  void add(Animal animal) {
    this.callOnceAdd = true;
    this.animal = animal;
  }

  @override
  Future<List> load() {}

  @override
  void update(List<Animal> animals) {}
}
