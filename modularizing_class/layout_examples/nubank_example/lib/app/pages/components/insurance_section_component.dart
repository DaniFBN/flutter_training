import 'package:flutter/material.dart';
import 'package:nu_design_system/nu_design_system.dart';

class InsuranceSectionComponent extends StatelessWidget {
  const InsuranceSectionComponent({super.key});

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
            title: 'Seguros',
            showArrow: false,
            onTap: () {
              print('Insurance Section is tapped');
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Proteçao para você cuidar do que importa',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.hintColor,
            ),
          ),
          const SizedBox(height: 18),
          const ButtonWidget(
            icon: Icons.favorite_border,
            text: 'Seguro de vida',
            action: 'Conhecer',
          ),
          const SizedBox(height: 20),
          const ButtonWidget(
            icon: Icons.phone_android_rounded,
            text: 'Seguro de celular',
            action: 'Conhecer',
          ),
        ],
      ),
    );
  }
}
