import 'package:flutter/cupertino.dart';

import 'badge_widget.dart';

class ChatCardIosWidget extends StatelessWidget {
  const ChatCardIosWidget({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.lastMessage,
    required this.lastMessageDate,
    required this.isMuted,
    required this.isFixed,
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
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(userImage),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        userName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(lastMessageDate),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      CupertinoIcons.check_mark,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        lastMessage,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style:
                            const TextStyle(color: CupertinoColors.systemGrey),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            if (isMuted)
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  CupertinoIcons.volume_off,
                                  size: 20,
                                  color: CupertinoColors.inactiveGray,
                                ),
                              ),
                            if (isFixed)
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Icon(
                                  CupertinoIcons.pin_fill,
                                  size: 20,
                                  color: CupertinoColors.inactiveGray,
                                ),
                              ),
                          ],
                        ),
                        if (hasNotification) ...{
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                            ),
                            child: BadgeWidget(
                              backgroundColor: CupertinoColors.activeBlue,
                              textColor: CupertinoColors.darkBackgroundGray,
                              label: notificationLength.toString(),
                              radius: 10,
                            ),
                          ),
                        },
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    
  }
}
