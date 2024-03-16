import "package:flutter/material.dart";

Color LIGHT_BACKGROUND_COLOR = Colors.white;
Color DARK_BACKGROUND_COLOR = Colors.grey.shade900;

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: LIGHT_BACKGROUND_COLOR,
    primary: Colors.black,
    secondary: Colors.black54,
  ),
  scaffoldBackgroundColor: LIGHT_BACKGROUND_COLOR,
  appBarTheme: AppBarTheme(
    backgroundColor: LIGHT_BACKGROUND_COLOR,
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: DARK_BACKGROUND_COLOR,
    primary: Colors.white,
    secondary: Colors.white54,
  ),
  scaffoldBackgroundColor: DARK_BACKGROUND_COLOR,
  appBarTheme: AppBarTheme(
    backgroundColor: DARK_BACKGROUND_COLOR,
  ),
);
