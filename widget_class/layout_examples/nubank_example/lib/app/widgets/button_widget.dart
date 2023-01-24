import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? action;

  const ButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Row(
        children: [
          Expanded(child: Text(text)),
          if (action != null)
            Text(
              action!,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
