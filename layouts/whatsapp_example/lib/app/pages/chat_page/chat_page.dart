import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/widgets/platform_widget.dart';

import '../../stores/platform_store.dart';
import 'chat_android_page.dart';
import 'chat_ios_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      platformStore: platformStore,
      iosChild: const ChatIosPage(),
      androidChild: const ChatAndroidPage(),
    );
  }
}
