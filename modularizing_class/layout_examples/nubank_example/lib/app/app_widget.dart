import 'package:flutter/material.dart';
import 'package:nu_design_system/nu_design_system.dart';

import 'pages/home_page.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nubank',
      theme: AppTheme.theme,
      initialRoute: AppRoutes.home,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home: (_) => const HomePage(),
      },
    );
  }
}
