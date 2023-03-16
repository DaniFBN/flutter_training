import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/widgets/badge_widget.dart';

import '../theme/custom_extension.dart';

class ChatCardWidget extends StatelessWidget {
  const ChatCardWidget({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.lastMessage,
    required this.lastMessageDate,
    this.isMuted = false,
    this.isFixed = false,
    this.notificationLength,
  }) : super(key: key);

  final String userImage;
  final String userName;
  final String lastMessage;
  final String lastMessageDate;
  final bool isMuted;
  final bool isFixed;
  final int? notificationLength;

  bool get hasNotification => notificationLength != null;

  @override
  Widget build(BuildContext context) {
    final customExtension = Theme.of(context).extension<CustomExtension>()!;

    return Row(
      children: [
        CircleAvatar(
          radius: 24,
          foregroundImage: NetworkImage(userImage),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 16,
                    color: customExtension.chatLastMessageColor,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      lastMessage,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: customExtension.chatLastMessageColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              lastMessageDate,
              style: TextStyle(
                color: hasNotification
                    ? customExtension.badgePrimaryColor
                    : customExtension.chatLastMessageColor,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                if (isMuted)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.volume_off_rounded,
                      size: 20,
                      color: customExtension.chatLastMessageColor,
                    ),
                  ),
                if (isFixed)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      Icons.push_pin,
                      size: 20,
                      color: customExtension.chatLastMessageColor,
                    ),
                  ),
                if (hasNotification) ...{
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: BadgeWidget(
                      backgroundColor: customExtension.badgePrimaryColor,
                      textColor: customExtension.badgePrimaryTextStyle.color!,
                      label: notificationLength.toString(),
                      radius: 10,
                    ),
                  ),
                }
              ],
            ),
          ],
        ),
      ],
    );
  }
}
