import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'app/pages/home_page/home_page.dart';
import 'app/stores/platform_store.dart';
import 'app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: platformStore,
      builder: (context, platform, child) {
        if (platformStore.isIos) {
          return CupertinoApp(
            showSemanticsDebugger: true,
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            theme: const CupertinoThemeData(
              brightness: Brightness.dark,
            ),
            home: const HomePage(),
          );
        }

        return MaterialApp(
          title: 'WhatsApp Example',
          // showSemanticsDebugger: true,
          scrollBehavior: MyCustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: const HomePage(),
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
