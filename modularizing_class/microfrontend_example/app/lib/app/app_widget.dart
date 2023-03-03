import 'package:app_dependencies/app_dependencies.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(AppRoutes.loginFullPagePath);

    return MaterialApp.router(
      title: 'MicroFrontend Example',
      theme: AppTheme.light,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
