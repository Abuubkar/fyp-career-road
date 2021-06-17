// @dart=2.7

import 'dart:ui' as ui;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:career_road/generated_plugin_registrant.dart';
import 'package:career_road/main.dart' as entrypoint;

Future<void> main() async {
  registerPlugins(webPluginRegistrar);
  await ui.webOnlyInitializePlatform();
  entrypoint.main();
}
