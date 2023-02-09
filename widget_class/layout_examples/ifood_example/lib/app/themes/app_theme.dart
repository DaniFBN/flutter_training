import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(color: Colors.white, fontSize: 10),
      actionsIconTheme: IconThemeData(
        color: Colors.red,
      ),
      // iconTheme: IconThemeData(color: Colors.red),
    ),
  );
}
