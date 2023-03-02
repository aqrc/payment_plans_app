import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomTheme {
  static const TextTheme textTheme = TextTheme(
    displaySmall: TextStyle(
      color: CustomColors.blue,
      fontSize: 50,
    ),
    headlineSmall: TextStyle(
      color: CustomColors.blue80,
      fontSize: 14,
    ),
    titleLarge: TextStyle(
      color: CustomColors.blue,
      fontSize: 20,
    ),
    titleMedium: TextStyle(
      color: CustomColors.blackGreen,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: CustomColors.blackGreen31,
      fontSize: 14,
      fontStyle: FontStyle.italic,
    ),
    labelLarge: TextStyle(
      color: CustomColors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    textTheme: textTheme,
    splashColor: CustomColors.green20,
    highlightColor: Colors.transparent,
    shadowColor: CustomColors.teal,
    colorScheme: const ColorScheme.light(
      primary: CustomColors.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
