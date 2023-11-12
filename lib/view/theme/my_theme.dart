import 'package:flutter/material.dart';

class MyTheme {
  MyTheme._();

  static ThemeData lightTheme() {
    return ThemeData.light(useMaterial3: true).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
