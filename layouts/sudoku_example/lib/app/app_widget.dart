import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'pages/statistic_page.dart';
import 'store/platform_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: platformStore,
      builder: (context, platform, child) {
        if (platformStore.isIos) {
          return CupertinoApp(
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            theme: const CupertinoThemeData(
              brightness: Brightness.light,
            ),
            home: const StatisticPage(),
          );
        }

        return MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          home: GestureDetector(
            onTap: platformStore.toggle,
            child: const Text('Home'),
          ),
        );
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
