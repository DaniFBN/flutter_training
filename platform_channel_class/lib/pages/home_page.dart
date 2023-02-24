import 'package:flutter/material.dart';
import 'package:platform_channel_class/pages/hello_page.dart';

import 'battery_page.dart';
import 'json_page.dart';
import 'list_page.dart';
import 'map_page.dart';
import 'stream_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MethodChannel Class')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _NavigationButton(
              page: HelloPage(),
              title: 'Hello Page',
            ),
            _NavigationButton(
              page: ListPage(),
              title: 'List Page',
            ),
            _NavigationButton(
              page: MapPage(),
              title: 'Map Page',
            ),
            _NavigationButton(
              page: JsonPage(),
              title: 'Json Page',
            ),
            _NavigationButton(
              page: BatteryPage(),
              title: 'Battery Page',
            ),
            _NavigationButton(
              page: StreamPage(),
              title: 'Stream Page',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final Widget page;
  final String title;

  const _NavigationButton({
    Key? key,
    required this.page,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: const Size(200, 36)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Text(title),
    );
  }
}
