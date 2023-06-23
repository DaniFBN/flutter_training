import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blue.shade800,
    primaryTextTheme: const TextTheme(),
    iconTheme: IconThemeData(color: Colors.blue.shade800),
  );
}
