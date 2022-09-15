import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xfffff5c4c);

  static final ThemeData lightTheme = ThemeData(
    // AppBar Theme
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 2),
      headline2: TextStyle(fontSize: 16, color: Colors.black),
    ),
  );
}
