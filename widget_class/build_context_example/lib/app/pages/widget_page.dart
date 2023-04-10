import 'package:flutter/material.dart';

import 'default_page.dart';

class WidgetPage extends StatelessWidget {
  const WidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultPage(
      title: 'Widget Page',
      leading: LeadingButton(),
    );
  }
}

class LeadingButton extends StatelessWidget {
  const LeadingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
