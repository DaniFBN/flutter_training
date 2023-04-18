import 'package:flutter/material.dart';

import 'default_page.dart';

class KeyPage extends StatefulWidget {
  const KeyPage({super.key});

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  late final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    super.initState();

    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      key: scaffoldKey,
      title: 'Key Page',
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
      ),
    );
  }
}
