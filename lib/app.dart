import 'package:flutter/material.dart';

import 'stacked/stacked_app.router.dart';
import 'theme/custom_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Split Payments App",
      theme: CustomTheme.lightTheme,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
