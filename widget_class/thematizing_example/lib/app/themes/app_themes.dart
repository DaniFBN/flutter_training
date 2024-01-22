import 'package:flutter/material.dart';

import 'color_extension.dart';

class AppThemes {
  const AppThemes._();

  static final light = ThemeData.light().copyWith(
    extensions: [
      const ColorExtension(
        primary: Colors.indigo,
        second: Colors.amber,
      )
    ],
  );

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      ColorExtension(
        primary: Colors.indigo.shade900,
        second: Colors.amber.shade900,
      )
    ],
  );
}
