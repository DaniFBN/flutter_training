import 'package:flutter/material.dart';

class TableActionButtonWidget extends StatelessWidget {
  const TableActionButtonWidget({
    Key? key,
    required this.color,
    this.title,
    required this.icon,
  }) : super(key: key);

  final Color color;
  final String? title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          if (title != null) ...[
            const SizedBox(width: 8),
            Text(
              title!,
              style: theme.textTheme.titleMedium!.copyWith(color: color),
            ),
          ]
        ],
      ),
    );
  }
}
