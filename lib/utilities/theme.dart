import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    primaryColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      // titleTextStyle: TextStyle(
      //   color: Colors.white,
      //   fontSize: 20,
      // ),
    ),
  );
  static final lightTheme = ThemeData(
    primarySwatch: Colors.green,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(),
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.green,
      // titleTextStyle: TextStyle(
      //   color: Colors.black,
      //   fontSize: 20,
      // ),
    ),
  );
}
