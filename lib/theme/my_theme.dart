import 'package:flutter/material.dart';

class MyTheme {
  static final _listColorScheme = ThemeData.light().colorScheme;
  static final light = ThemeData.light().copyWith(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    scaffoldBackgroundColor: const Color.fromARGB(255, 248, 248, 248),
    primaryColor: const Color.fromARGB(255, 93, 93, 93),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(16),
      ),
    ),
    colorScheme: _listColorScheme.copyWith(
      primary: const Color.fromARGB(255, 88, 102, 255),
      background: const Color(0xff191919),
      onPrimary: Colors.white,
      secondary: Colors.pink,
      onSecondary: Colors.white,
      primaryContainer: const Color.fromARGB(30, 206, 208, 206),
      onPrimaryContainer: const Color.fromARGB(63, 239, 243, 246),
    ),
  );
}
