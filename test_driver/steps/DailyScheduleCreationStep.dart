import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric DailyScheduleCreation() {
  return when2<String, String, FlutterWorld>(
      'I expect the {string} to be {string}', (key1, text, context) async {
    final locator = find.byValueKey(key1);
    text == await FlutterDriverUtils.getText(context.world.driver, locator);
  });
}
