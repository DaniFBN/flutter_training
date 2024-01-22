import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

import '../stores/theme_store.dart';
import 'stateful_page.dart';
import 'stateless_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'WidgetExample',
      body: DefaultMenu(
        options: [
          const DefaultNavigationButton(
            title: 'Stateless Page',
            page: StatelessPage(),
          ),
          DefaultNavigationButton(
            title: 'Stateful Page',
            page: StatefulPage(
              themeStore: themeStore,
            ),
          ),
        ],
      ),
    );
  }
}
