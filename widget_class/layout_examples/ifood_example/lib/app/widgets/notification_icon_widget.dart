import 'package:flutter/material.dart';
import 'package:ifood_example/app/app_widget.dart';

class NotificationIconWidget extends StatelessWidget {
  final int notificationLength;

  const NotificationIconWidget({
    Key? key,
    required this.notificationLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme2 = Theme.of(context);

    return GestureDetector(
      onTap: () {
        print('NotificationIconWidget is tapped');
        theme.toggleTheme();
      },
      child: SizedBox(
        height: 36,
        width: 36,
        child: Center(
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.notifications_none_rounded,
                ),
              ),
              Positioned(
                top: 10,
                right: 2,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: theme2.appBarTheme.actionsIconTheme?.color,
                  ),
                  child: Center(
                    child: Text(
                      '$notificationLength',
                      style: theme2.appBarTheme.toolbarTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
