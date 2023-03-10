import 'package:flutter/material.dart';

class CustomExtension extends ThemeExtension<CustomExtension> {
  final Color badgePrimaryColor;
  final TextStyle badgePrimaryTextStyle;
  final Color badgeSecondaryColor;
  final TextStyle badgeSecondaryTextStyle;
  final Color chatLastMessageColor;

  CustomExtension({
    required this.badgePrimaryColor,
    required this.badgePrimaryTextStyle,
    required this.badgeSecondaryColor,
    required this.badgeSecondaryTextStyle,
    required this.chatLastMessageColor,
  });

  @override
  ThemeExtension<CustomExtension> copyWith({
    Color? badgePrimaryColor,
    TextStyle? badgePrimaryTextStyle,
    Color? badgeSecondaryColor,
    TextStyle? badgeSecondaryTextStyle,
    Color? chatLastMessageColor,
  }) {
    return CustomExtension(
      badgePrimaryColor: badgePrimaryColor ?? this.badgePrimaryColor,
      badgePrimaryTextStyle:
          badgePrimaryTextStyle ?? this.badgePrimaryTextStyle,
      badgeSecondaryColor: badgeSecondaryColor ?? this.badgeSecondaryColor,
      badgeSecondaryTextStyle:
          badgeSecondaryTextStyle ?? this.badgeSecondaryTextStyle,
      chatLastMessageColor: chatLastMessageColor ?? this.chatLastMessageColor,
    );
  }

  @override
  ThemeExtension<CustomExtension> lerp(
    ThemeExtension<CustomExtension>? other,
    double t,
  ) {
    if (other == null) return this;

    return this;

    // return CustomExtension(
    //   badgePrimaryColor: t < 0.5 ? badgePrimaryColor : other.badgePrimaryColor,
    //   badgePrimaryTextStyle:
    //       t < 0.5 ? badgePrimaryTextStyle : other.badgePrimaryTextStyle,
    //   badgeSecondaryColor:
    //       t < 0.5 ? badgeSecondaryColor : other.badgeSecondaryColor,
    //   badgeSecondaryTextStyle:
    //       t < 0.5 ? badgeSecondaryTextStyle : other.badgeSecondaryTextStyle,
    //   chatLastMessageColor:
    //       t < 0.5 ? chatLastMessageColor : other.chatLastMessageColor,
    // );
  }
}
