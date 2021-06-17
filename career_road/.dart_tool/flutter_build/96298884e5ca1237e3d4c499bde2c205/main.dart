// @dart=2.7

import 'dart:ui' as ui;

import 'package:career_road/main.dart' as entrypoint;

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  entrypoint.main();
}
