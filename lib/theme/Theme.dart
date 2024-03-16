import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

Color lightBackgroundColor = Colors.white;
Color darkBackgroundColor = Colors.grey.shade900;
TextTheme defaultTextTheme = GoogleFonts.outfitTextTheme();

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: lightBackgroundColor,
    primary: Colors.black,
    secondary: Colors.black54,
  ),
  scaffoldBackgroundColor: lightBackgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: lightBackgroundColor,
  ),
  textTheme: defaultTextTheme,
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: darkBackgroundColor,
    primary: Colors.white,
    secondary: Colors.white54,
  ),
  scaffoldBackgroundColor: darkBackgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackgroundColor,
  ),
  textTheme: defaultTextTheme,
);
