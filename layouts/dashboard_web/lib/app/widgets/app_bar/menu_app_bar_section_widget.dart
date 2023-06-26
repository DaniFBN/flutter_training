import 'package:flutter/material.dart';

import 'app_bar_item_widget.dart';

class MenuAppBarSectionWidget extends StatelessWidget {
  const MenuAppBarSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(maxWidth: size.height * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBarItemWidget(
            icon: Icons.home,
            label: Text(
              'Home'.toUpperCase(),
              style: theme.textTheme.titleSmall,
            ),
          ),
          AppBarItemWidget(
            icon: Icons.article_outlined,
            label: Text(
              'Relatórios'.toUpperCase(),
              style: theme.textTheme.titleSmall,
            ),
          ),
          AppBarItemWidget(
            icon: Icons.flutter_dash,
            label: Text(
              'Portal Dashboard'.toUpperCase(),
              style: theme.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
