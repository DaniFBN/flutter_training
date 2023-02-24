import 'dart:math';

import 'package:flutter/material.dart';
import 'package:modular_example/app/core/color/color_store.dart';
import 'package:modular_example/app/core/menu/observe_di.dart';

import '../shared/services/navigation_service.dart';

class MenuPage extends StatefulWidget {
  final ColorStore colorStore;

  const MenuPage({
    Key? key,
    required this.colorStore,
  }) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final pages = {
    _MenuItem(color: Colors.blue, title: 'Blue'),
    _MenuItem(color: Colors.redAccent, title: 'Red'),
    _MenuItem(color: Colors.green, title: 'Green'),
    _MenuItem(
      color: Colors.indigo.shade400,
      title: 'SpecialBlue',
      route: 'blue/special',
    ),
  };

  _MenuItem generateRandom() {
    final random = Random();
    final r = random.nextInt(255);
    final g = random.nextInt(255);
    final b = random.nextInt(255);

    final color = Color.fromRGBO(r, g, b, 1);

    return _MenuItem(color: color, title: 'Random');
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.colorStore,
      builder: (_, value, child) {
        ObserveDI.observe();

        return Scaffold(
          backgroundColor: widget.colorStore.color,
          appBar: AppBar(
            title: const Text('Modular Examples'),
            actions: [
              TextButton(
                child: const Text(
                  'Not found',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  NavigationService.instance.pushNamed('/whatever');
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: pages.length + 1,
              separatorBuilder: (_, __) => const Padding(
                padding: EdgeInsets.all(8),
              ),
              itemBuilder: (_, i) {
                late final _MenuItem page;
                if (i < pages.length) {
                  page = pages.elementAt(i);
                } else {
                  page = generateRandom();
                }

                return Card(
                  color: page.color.withOpacity(0.5),
                  child: ListTile(
                    onTap: () {
                      NavigationService.instance.pushNamed(page.route, arguments: page.color);
                    },
                    leading: CircleAvatar(backgroundColor: page.color),
                    title: Text(page.title),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _MenuItem {
  final Color color;
  final String title;
  late final String route;

  _MenuItem({
    required this.color,
    required this.title,
    String? route,
  }) : route = route ?? '/${title.toLowerCase()}/';
}
