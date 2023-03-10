import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/widgets/badge_widget.dart';

class TabBarItemWidget extends StatelessWidget {
  const TabBarItemWidget({
    Key? key,
    required this.width,
    required this.child,
    this.badgeLabel,
  }) : super(key: key);

  final double width;
  final Widget child;
  final String? badgeLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          // Set
          // Spread
          if (badgeLabel != null) ...{
            const SizedBox(width: 4),
            BadgeWidget.secondary(label: badgeLabel!, radius: 10),
          },
        ],
      ),
    );
  }
}
