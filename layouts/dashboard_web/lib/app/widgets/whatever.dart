import 'package:flutter/material.dart';

class Whatever extends StatelessWidget {
  const Whatever({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 28),
        const SizedBox(width: 8),
        label,
      ],
    );
  }
}
