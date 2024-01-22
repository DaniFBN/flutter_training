import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'stores/theme_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Bug without WidgetApp(CupertinoApp, FluentApp, MaterialApp)
    // return const HomePage();

    return ValueListenableBuilder(
      valueListenable: themeStore,
      builder: (_, themeMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WidgetExample',
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const HomePage(),
        );
      },
    );
  }
}
