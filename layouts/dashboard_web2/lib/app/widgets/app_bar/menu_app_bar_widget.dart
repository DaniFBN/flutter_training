import 'package:dashboard_web2/app/theme/color_extension.dart';
import 'package:flutter/material.dart';

class MenuAppBarWidget extends StatelessWidget {
  const MenuAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('HOME', style: appBarTheme.titleTextStyle),
        const _VerticalDivider(),
        Text('RELATÓRIOS', style: appBarTheme.titleTextStyle),
        const _VerticalDivider(),
        Text('PORTAL', style: appBarTheme.titleTextStyle),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ColorExtension>()!;

    return Container(
      width: 1,
      height: 20,
      color: theme.primaryDividerColor,
    );
  }
}
