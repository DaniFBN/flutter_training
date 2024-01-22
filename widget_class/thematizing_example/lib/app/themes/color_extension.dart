import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  final Color primary;
  final Color second;

  const ColorExtension({
    required this.primary,
    required this.second,
  });

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? primary,
    Color? second,
  }) {
    return ColorExtension(
      primary: primary ?? this.primary,
      second: second ?? this.second,
    );
  }

  @override
  ThemeExtension<ColorExtension> lerp(
    covariant ThemeExtension<ColorExtension>? other,
    double t,
  ) {
    if (t < 0.5) return this;
    return other!;
  }

  static ColorExtension of(BuildContext context) {
    return Theme.of(context).extension<ColorExtension>()!;
  }
}
