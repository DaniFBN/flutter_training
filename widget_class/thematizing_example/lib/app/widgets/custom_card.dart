import 'package:flutter/material.dart';

import '../themes/color_extension.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ColorExtension.of(context);
    final theme = Theme.of(context);

    return Card(
      color: colors.second,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://avatars.githubusercontent.com/u/54218517?v=4',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Whatever',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: colors.primary),
                ),
                const SizedBox(height: 12),
                Text(
                  'Subtitle',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: colors.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
