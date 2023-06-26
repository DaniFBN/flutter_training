import 'package:flutter/material.dart';

class TableContentWidget extends StatelessWidget {
  const TableContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final data = List.generate(
      5,
      (index) {
        return TableContentModel(
          label: 'Data $index',
          flex: index == 1 || index == 4 ? 2 : 1,
        );
      },
    );

    return ListView.builder(
      itemCount: 20,
      itemBuilder: (_, index) {
        return Container(
          color: index.isEven ? Colors.grey.shade100 : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: data.map((e) {
                return Expanded(
                  flex: e.flex,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      e.label,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class TableContentModel {
  final String label;
  final int flex;

  const TableContentModel({
    required this.label,
    required this.flex,
  });
}
