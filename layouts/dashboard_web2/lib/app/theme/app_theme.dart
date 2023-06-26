import 'package:dashboard_web2/app/theme/color_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    primaryColor: Colors.indigo,
    dividerColor: Colors.indigo,
    iconTheme: const IconThemeData(color: Colors.indigo),
    textTheme: const TextTheme(),
    appBarTheme: const AppBarTheme(
      color: Colors.indigo,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
    extensions: const [
      ColorExtension(
        primaryDividerColor: Colors.white,
      ),
    ],
  );
}
