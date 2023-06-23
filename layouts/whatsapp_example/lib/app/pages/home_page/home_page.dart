import 'package:flutter/material.dart';
import 'package:whatsapp_example/app/pages/home_page/home_android_page.dart';
import 'package:whatsapp_example/app/pages/home_page/home_ios_page.dart';
import 'package:whatsapp_example/app/widgets/platform_widget.dart';

import '../../stores/platform_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      platformStore: platformStore,
      iosChild: const HomeIosPage(),
      androidChild: const HomeAndroidPage(),
    );
  }
}
