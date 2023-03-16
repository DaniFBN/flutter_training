import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String label;
  final double radius;
  final Color backgroundColor;
  final Color textColor;

  const BadgeWidget({
    Key? key,
    required this.label,
    required this.radius,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
