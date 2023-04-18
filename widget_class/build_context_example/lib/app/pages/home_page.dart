import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

import 'builder_page.dart';
import 'error_page.dart';
import 'key_page.dart';
import 'widget_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      title: 'BuildContextExample',
      body: DefaultMenu(
        options: [
          DefaultNavigationButton(page: ErrorPage(), title: 'Error Page'),
          DefaultNavigationButton(page: BuilderPage(), title: 'Builder Page'),
          DefaultNavigationButton(page: WidgetPage(), title: 'Widget Page'),
          DefaultNavigationButton(page: KeyPage(), title: 'Key Page'),
        ],
      ),
    );
  }
}
