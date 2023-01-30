import 'package:flutter/material.dart';
import 'package:nu_design_system/nu_design_system.dart';

import '../../data/mock.dart';

class LoanSectionComponent extends StatelessWidget {
  const LoanSectionComponent({super.key});

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
            title: 'Empréstimo',
            onTap: () {
              print('Loan Section is tapped');
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Valor disponível de até',
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.hintColor,
            ),
          ),
          Text(
            AppMock.loanLimit,
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
