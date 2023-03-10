// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/widgets/tab_bar_item_widget.dart';

class HomeTabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const HomeTabBarWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabs: <Widget>[
        TabBarItemWidget(
          width: size.width * 0.1,
          child: const Icon(Icons.people_alt_rounded),
        ),
        TabBarItemWidget(
          width: size.width * 0.2,
          badgeLabel: '3',
          child: const Text(
            'Chats',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TabBarItemWidget(
          width: size.width * 0.2,
          child: const Text('Status'),
        ),
        TabBarItemWidget(
          width: size.width * 0.2,
          child: const Text('Calls'),
        ),
      ],
    );
  }
}
