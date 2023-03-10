import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/widgets/tab_bar_widget.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const HomeAppBarWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(110);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('WhatsApp'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_outlined),
        ),
      ],
      bottom: HomeTabBarWidget(
        tabController: tabController,
      ),
    );
  }
}
