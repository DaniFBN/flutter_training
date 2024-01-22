import 'package:flutter/material.dart';

import 'default_page.dart';

class BuilderPage extends StatelessWidget {
  const BuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      title: 'Builder Page',
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
    );
  }
}
