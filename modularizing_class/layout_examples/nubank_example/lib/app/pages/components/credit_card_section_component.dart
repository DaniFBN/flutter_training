import 'package:flutter/material.dart';
import 'package:nu_design_system/nu_design_system.dart';

import '../../data/mock.dart';

class CreditCardSectionComponent extends StatelessWidget {
  const CreditCardSectionComponent({super.key});

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
            title: 'Cartão de crédito',
            onTap: () {
              print('Credit Card Section is tapped');
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Fatura atual',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.hintColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppMock.invoiceValue,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Limite disponível de ${AppMock.creditLimit}',
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          const ButtonWidget(
            icon: Icons.credit_card,
            text: 'Parcelar compras',
          ),
        ],
      ),
    );
  }
}
