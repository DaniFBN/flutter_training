import 'package:flutter/material.dart';

import 'notification_icon_widget.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String address;
  final int notificationLength;
  final PreferredSizeWidget tabBar;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);

  const HomeAppBarWidget({
    super.key,
    required this.address,
    required this.notificationLength,
    required this.tabBar,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: tabBar,
      title: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(address),
            const Icon(Icons.keyboard_arrow_down_rounded, size: 20)
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: NotificationIconWidget(notificationLength: notificationLength),
        ),
      ],
    );
  }
}
