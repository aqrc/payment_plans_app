import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.transparent,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
    )
  );
}
