import 'package:flutter_driver/flutter_driver.dart' ; import 'package:test/test.dart';



void main() {
  group('', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('xxx', () async {
      // visit todo list page
      expect(await driver.getText(find.byValueKey('init')), "There is no todo");
//      await driver.tap(find.byType())
      // click new todo button
      // visit new todo page
      // fill in todo title
      // click submit
      // see new todo in list page
    });
  });
}
