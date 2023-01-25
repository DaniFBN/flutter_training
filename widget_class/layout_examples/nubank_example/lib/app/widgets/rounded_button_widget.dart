import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String label;

  const RoundedButtonWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        label,
        style: theme.primaryTextTheme.bodySmall?.copyWith(
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
