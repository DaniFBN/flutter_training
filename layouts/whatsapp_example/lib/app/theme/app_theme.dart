import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/theme/custom_extension.dart';
import 'package:whatsapp_example/app/theme/light/light_colors.dart';

class AppTheme {
  static final light = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: LightColors.primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightColors.primary,
    ),
    tabBarTheme: const TabBarTheme(
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 3,
            color: Colors.white,
          ),
        ),
      ),
    ),
    extensions: [
      CustomExtension(
        badgePrimaryColor: LightColors.greenLight,
        badgePrimaryTextStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        badgeSecondaryColor: Colors.white,
        badgeSecondaryTextStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: LightColors.primary,
        ),
        chatLastMessageColor: const Color(0xFF8a8486),
      ),
    ],
  );
}
