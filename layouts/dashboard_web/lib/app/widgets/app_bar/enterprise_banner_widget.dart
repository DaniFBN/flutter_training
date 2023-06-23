import 'package:flutter/material.dart';

class EnterpriseBannerWidget extends StatelessWidget {
  const EnterpriseBannerWidget({
    Key? key,
    required this.name,
    required this.logo,
  }) : super(key: key);

  final String name;
  final Widget logo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
      child: Row(
        children: [
          logo,
          const SizedBox(width: 20),
          Text(name, style: theme.primaryTextTheme.headlineSmall),
        ],
      ),
    );
  }
}
