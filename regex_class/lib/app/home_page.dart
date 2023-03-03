import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

import 'pages/quantifier_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultScaffold(
      title: 'Regex Class',
      body: DefaultMenu(
        options: [
          DefaultNavigationButton(
            page: QuantifierPage(),
            title: 'QuantifierPage',
          ),
        ],
      ),
    );
  }
}
