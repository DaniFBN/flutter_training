import 'package:flutter/material.dart';

import '../../widgets/chat_card_widget.dart';

class ChatAndroidPage extends StatelessWidget {
  const ChatAndroidPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.separated(
        itemCount: 30,
        separatorBuilder: (_, __) => Padding(
          padding: EdgeInsets.only(left: size.width * 0.15),
          child: const Divider(
            thickness: 0.5,
          ),
        ),
        itemBuilder: (_, __) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: ChatCardWidget(
              lastMessage:
                  'Whatever aaaaaaaaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaaaaa aaaaaaaaa aaaaaaaaaa',
              lastMessageDate: 'Ontem',
              userImage: 'https://avatars.githubusercontent.com/u/54218517?v=4',
              userName:
                  'Daniel Fernandes aa aaaaaaaa aaaaa aaaaa aaaaaa aaaaaa aaaaaaaaa aaaaaaaaaa aaaaaaa aaaa',
              notificationLength: 2,
              isFixed: true,
              isMuted: true,
            ),
          );
        },
      ),
    );
  }
}
