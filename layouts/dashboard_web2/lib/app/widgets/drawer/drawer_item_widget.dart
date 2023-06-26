import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.isOpen,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!isOpen) return Icon(icon);

    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 4),
        Text(
          title.toUpperCase(),
          style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColor),
        ),
      ],
    );
  }
}
