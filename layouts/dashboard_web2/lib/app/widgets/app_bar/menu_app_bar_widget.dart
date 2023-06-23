import 'package:flutter/material.dart';

class MenuAppBarWidget extends StatelessWidget {
  const MenuAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Home'),
        _VerticalDivider(),
        Text('Relatórios'),
        _VerticalDivider(),
        Text('Portal'),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 1,
      height: 20,
      color: theme.dividerColor,
    );
  }
}
