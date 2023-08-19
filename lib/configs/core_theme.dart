import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  primaryColorLight: const Color.fromARGB(255, 2, 44, 231),
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 2, 44, 231),
  highlightColor: Colors.black,
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  backgroundColor: Colors.white,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
    secondary: Colors.black,
    brightness: Brightness.light,
  ),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: const Color.fromARGB(255, 2, 44, 231),
  primaryColor: const Color.fromARGB(255, 2, 44, 231),
  highlightColor: const Color.fromARGB(255, 2, 44, 231),
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  backgroundColor: Colors.grey[800],
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
    secondary: const Color.fromARGB(255, 2, 44, 231),
    brightness: Brightness.dark,
  ),
);
