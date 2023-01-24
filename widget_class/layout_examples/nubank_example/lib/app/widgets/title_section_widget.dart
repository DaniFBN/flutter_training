// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool showArrow;

  const TitleSectionWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.showArrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: theme.textTheme.titleMedium),
          ),
          if (showArrow)
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            )
        ],
      ),
    );
  }
}
