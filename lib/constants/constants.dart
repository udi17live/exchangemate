import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color lightBackgroundColor = Colors.white;
Color darkBackgroundColor = Colors.grey.shade900;
TextTheme defaultTextTheme = GoogleFonts.outfitTextTheme();

enum ThemePreference {
  light,
  dark,
  system,
}

ThemeData light = ThemeData(
  primaryColor: Colors.black,
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.light().copyWith(
    background: lightBackgroundColor,
    primary: Colors.black,
    secondary: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: lightBackgroundColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: defaultTextTheme,
);

ThemeData dark = ThemeData(
  primaryColor: Colors.white,
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme.dark().copyWith(
    background: darkBackgroundColor,
    primary: Colors.white,
    secondary: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackgroundColor,
  ),
  scaffoldBackgroundColor: darkBackgroundColor,
  textTheme: defaultTextTheme,
);

const String themeKey = 'theme_key';
