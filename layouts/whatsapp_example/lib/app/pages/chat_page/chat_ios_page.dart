import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/stores/platform_store.dart';

import '../../widgets/chat_card_ios_widget.dart';

class ChatIosPage extends StatelessWidget {
  const ChatIosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CupertinoButton(onPressed: () {}, child: const Text('Edit')),
              const Spacer(),
              CupertinoButton(
                onPressed: platformStore.toggle,
                child: const Icon(Icons.apple),
              ),
              CupertinoButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.add),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Chats',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                onPressed: () {},
                child: const Text('Broadcast Lists'),
              ),
              CupertinoButton(
                onPressed: () {},
                child: const Text('New Group'),
              ),
            ],
          ),
          const Divider(color: CupertinoColors.inactiveGray, thickness: 0.3),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1000,
              separatorBuilder: (_, __) => Padding(
                padding: EdgeInsets.only(left: size.width * 0.2),
                child: const Divider(
                    color: CupertinoColors.inactiveGray, thickness: 0.3),
              ),
              itemBuilder: (_, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ChatCardIosWidget(
                    lastMessage:
                        'Whatever aaaaaaaaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaaaaa aaaaaaaaa aaaaaaaaaa',
                    lastMessageDate: 'Ontem',
                    userImage:
                        'https://avatars.githubusercontent.com/u/54218517?v=4',
                    userName:
                        'Daniel Fernandes aa aaaaaaaa aaaaa aaaaa aaaaaa aaaaaa aaaaaaaaa aaaaaaaaaa aaaaaaa aaaa',
                    notificationLength: 2,
                    isFixed: true,
                    isMuted: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
