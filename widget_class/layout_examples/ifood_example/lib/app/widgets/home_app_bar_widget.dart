import 'package:flutter/material.dart';

import 'notification_icon_widget.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String address;
  final int notificationLength;

  const HomeAppBarWidget({
    super.key,
    required this.address,
    required this.notificationLength,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return AppBar(
      title: Row(
        children: [
          Text(address),
          const Icon(Icons.keyboard_arrow_down_rounded)
        ],
      ),
      actions: [
        NotificationIconWidget(notificationLength: notificationLength),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
