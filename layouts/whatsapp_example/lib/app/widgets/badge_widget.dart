import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/theme/custom_extension.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget.secondary({
    Key? key,
    required this.label,
    required this.radius,
  })  : _usePrimaryColor = false,
        super(key: key);

  const BadgeWidget.primary({
    Key? key,
    required this.label,
    required this.radius,
  })  : _usePrimaryColor = true,
        super(key: key);

  final String label;
  final double radius;
  final bool _usePrimaryColor;

  @override
  Widget build(BuildContext context) {
    final customExtension = Theme.of(context).extension<CustomExtension>()!;

    return CircleAvatar(
      radius: radius,
      backgroundColor: _usePrimaryColor
          ? customExtension.badgePrimaryColor
          : customExtension.badgeSecondaryColor,
      child: Text(
        label,
        style: _usePrimaryColor
            ? customExtension.badgePrimaryTextStyle
            : customExtension.badgeSecondaryTextStyle,
      ),
    );
  }
}
