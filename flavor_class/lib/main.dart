import 'package:flavor_class/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'flavor/app_flavor.dart';

void main() {
  const env = String.fromEnvironment('env', defaultValue: 'dev');
  const client = String.fromEnvironment('client', defaultValue: 'default');

  AppFlavor.changeFlavor(env: env, client: client);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppFlavor.client.name,
      theme: AppFlavor.client.theme.copyWith(
        extensions: [
          AppTheme(appBarTitleStyle: TextStyle()),
        ]
      ),
      home: const HomePage(),
    );
  }
}

class AppTheme extends ThemeExtension<AppTheme> {
  final TextStyle appBarTitleStyle;

  AppTheme({
    required this.appBarTitleStyle,
  });

  @override
  ThemeExtension<AppTheme> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    throw UnimplementedError();
  }
}
