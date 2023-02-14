import 'package:flutter/material.dart';

class AreaCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  const AreaCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: Card(
            child: SizedBox(child: Image.network(imageUrl)),
          ),
        ),
        const SizedBox(height: 4),
        FittedBox(
          child: Text(
            title,
            maxLines: 1,
            style: theme.textTheme.titleSmall,
          ),
        ),
      ],
    );
  }
}
