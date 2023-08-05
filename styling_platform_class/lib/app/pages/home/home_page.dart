import 'package:flutter/material.dart';

import '../../responsive_widget.dart';
import '../../scaffolds.dart';
import 'home_android_page.dart';
import 'home_ios_page.dart';
import 'home_web_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    print('request');
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      android: MobileScaffold(body: HomeAndroidPage()),
      ios: IosScaffold(body: HomeIosPage()),
      web: WebScaffold(body: HomeWebPage()),
    );
  }
}
