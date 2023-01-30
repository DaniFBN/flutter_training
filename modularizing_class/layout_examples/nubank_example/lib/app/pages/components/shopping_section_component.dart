import 'package:flutter/material.dart';
import 'package:nu_design_system/nu_design_system.dart';

class ShoppingSectionComponent extends StatelessWidget {
  const ShoppingSectionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          TitleSectionWidget(
            title: 'Shopping',
            onTap: () {
              print('Shopping Section is tapped');
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Vantagens exclusivas das nossas marcas preferidas',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
