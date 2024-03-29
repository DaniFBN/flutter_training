import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/pages/call_page.dart';
import 'package:whatsapp_example/app/pages/chat_page/chat_page.dart';
import 'package:whatsapp_example/app/pages/community_page.dart';
import 'package:whatsapp_example/app/pages/status_page.dart';
import 'package:whatsapp_example/app/widgets/home_app_bar_widget.dart';

class HomeAndroidPage extends StatefulWidget {
  const HomeAndroidPage({super.key});

  @override
  State<HomeAndroidPage> createState() => _HomeAndroidPageState();
}

class _HomeAndroidPageState extends State<HomeAndroidPage>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(tabController: tabController),
      body: TabBarView(
        controller: tabController,
        children: const [
          CommunityPage(),
          ChatPage(),
          StatusPage(),
          CallPage(),
        ],
      ),
    );
  }
}
