import 'package:flutter/cupertino.dart';
import 'package:whatsapp_example/app/pages/call_page.dart';
import 'package:whatsapp_example/app/pages/camera_page.dart';
import 'package:whatsapp_example/app/pages/status_page.dart';
import 'package:whatsapp_example/app/widgets/badge_widget.dart';

import '../chat_page/chat_ios_page.dart';
import '../settings_page.dart';

class HomeIosPage extends StatelessWidget {
  const HomeIosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 3,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
            label: 'Status',
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.phone_fill),
            icon: Icon(
              CupertinoIcons.phone,
            ),
            label: 'Calls',
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(CupertinoIcons.camera_fill),
            icon: Icon(
              CupertinoIcons.camera,
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            activeIcon: Stack(
              children: const [
                Icon(CupertinoIcons.chat_bubble_2_fill),
                Positioned(
                  top: 0,
                  right: 0,
                  child: BadgeWidget(
                    label: '5',
                    radius: 10,
                    backgroundColor: CupertinoColors.systemRed,
                    textColor: CupertinoColors.white,
                  ),
                ),
              ],
            ),
            icon: Stack(
              children: const [
                Icon(CupertinoIcons.chat_bubble_2),
                Positioned(
                  top: 0,
                  right: 0,
                  child: BadgeWidget(
                    label: '5',
                    radius: 10,
                    backgroundColor: CupertinoColors.systemRed,
                    textColor: CupertinoColors.white,
                  ),
                ),
              ],
            ),
            label: 'Chats',
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          )
        ],
      ),
      tabBuilder: (_, index) {
        if (index == 0) {
          return const StatusPage();
        } else if (index == 1) {
          return const CallPage();
        } else if (index == 2) {
          return const CameraPage();
        } else if (index == 3) {
          return const ChatIosPage();
        } else {
          return const SettingsPage();
        }
      },
    );
  }
}
