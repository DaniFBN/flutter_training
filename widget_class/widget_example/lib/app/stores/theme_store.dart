import 'package:flutter/material.dart';

class ThemeStore extends ValueNotifier<ThemeMode> {
  ThemeStore(super.value);

  void toggle() {
    if (value == ThemeMode.dark) {
      value = ThemeMode.light;
    } else {
      value = ThemeMode.dark;
    }
  }
}

final themeStore = ThemeStore(ThemeMode.dark);
