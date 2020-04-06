import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

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

    test('add new todo journy', () async {
      await containText(driver, "dummy toilet");
      await driver.tap(find.byType("RaisedButton"));
      await containText(driver, "New Todo");
      // fill in todo title
      // click submit
      // see new todo in list page
    });
  });
}

Future containText(FlutterDriver driver, String text) async {
  await driver.waitFor(find.text(text), timeout: Duration(seconds: 3)).catchError((e) {
    throw StateError("Assertion Error: couldn't find text '" + text + "' in screen.");
  });
}
