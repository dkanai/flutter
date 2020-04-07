import 'package:flutter_driver/flutter_driver.dart';

class WebDriver {
  FlutterDriver driver;

  Future<void> init() async {
    driver = await FlutterDriver.connect();
  }

  Future containText(String text) async {
    await driver.waitFor(find.text(text), timeout: Duration(seconds: 3)).catchError((e) {
      throw StateError("Assertion Error: couldn't find text '" + text + "' in screen.");
    });
  }

  void close() {
    if (driver != null) {
      driver.close();
    }
  }

  Future<void> tap(String targetType) async {
    await driver.tap(find.byType(targetType));
  }
}
