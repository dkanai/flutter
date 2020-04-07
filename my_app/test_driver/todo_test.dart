import 'package:test/test.dart';

import 'web_driver.dart';

void main() {
  WebDriver driver = WebDriver();
  setUpAll(() async => await driver.init());
  tearDownAll(() async => driver.close());

  test('add new todo journy', () async {
    await driver.containText("dummy toilet");
    await driver.tap("RaisedButton");
    await driver.containText("New Todo");
    // fill in todo title
    // click submit
    // see new todo in list page
  });
}
