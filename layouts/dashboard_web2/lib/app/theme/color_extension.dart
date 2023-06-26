import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color primaryDividerColor;

  const ColorExtension({
    required this.primaryDividerColor,
  });

  @override
  ColorExtension copyWith({
    Color? primaryDividerColor,
  }) {
    return ColorExtension(
      primaryDividerColor: primaryDividerColor ?? this.primaryDividerColor,
    );
  }

  @override
  ThemeExtension<ColorExtension> lerp(
    covariant ThemeExtension<ColorExtension>? other,
    double t,
  ) {
    if (t < 0.5 || other == null) return this;
    return other;
  }
}
