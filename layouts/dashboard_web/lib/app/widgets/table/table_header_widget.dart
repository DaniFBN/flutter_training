import 'package:flutter/material.dart';

class TableHeaderWidget extends StatelessWidget {
  const TableHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final data = List.generate(
      5,
      (index) {
        return TableHeaderModel(
          label: 'Header $index',
          flex: index == 1 || index == 4 ? 2 : 1,
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: data.map((e) {
          return Expanded(
            flex: e.flex,
            child: Text(
              e.label,
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TableHeaderModel {
  final String label;
  final int flex;

  const TableHeaderModel({
    required this.label,
    required this.flex,
  });
}
