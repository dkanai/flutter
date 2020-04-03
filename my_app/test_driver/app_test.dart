import 'package:flutter_driver/flutter_driver.dart' ; import 'package:test/test.dart';



void main() {
  group('Animal app', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('add new animal', () async {
      expect(await driver.getText(find.byValueKey('animals-widget')), "There is no animal");
      await driver.tap(find.byValueKey('new_animal_button'));
      await driver.tap(find.byType('TextFormField'));
      await driver.enterText('Big Dog');
      await driver.tap(find.byType('RaisedButton'));
//      expect(await driver.getText(xxx), "Big Dog");
    });
  });
}
