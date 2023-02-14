import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const TabBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: true,
      tabs: const [
        Tab(child: Text('Início')),
        Tab(child: Text('Restaurantes')),
        Tab(child: Text('Mercados')),
        Tab(child: Text('Bebidas')),
        Tab(child: Text('Farmácias')),
      ],
    );
  }
}
