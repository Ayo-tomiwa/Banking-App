import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  primaryColor: Colors.teal,
  primarySwatch: Colors.teal,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16.0),
    labelLarge: TextStyle(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.teal,
      textStyle: const TextStyle(fontSize: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);
