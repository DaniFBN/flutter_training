import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'stores/theme_store.dart';
import 'themes/app_themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStore,
      builder: (_, themeMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ThematizingExample',
          themeMode: themeMode,
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          home: HomePage(themeStore: themeStore),
        );
      },
    );
  }
}
