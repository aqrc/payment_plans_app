import 'package:flutter/material.dart';

import 'app.dart';
import 'stacked/stacked_app.locator.dart';

void main() async {
  await setupLocator();

  runApp(const App());
}