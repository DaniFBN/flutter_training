import 'package:flutter/material.dart';

import 'android/home_android_page.dart';
import 'ios/home_ios_page.dart';
import 'responsive_widget.dart';
import 'scaffolds.dart';
import 'web/home_web_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      android: MobileScaffold(body: HomeAndroidPage()),
      ios: IosScaffold(body: HomeIosPage()),
      web: WebScaffold(body: HomeWebPage()),
    );
  }
}
