import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:struct_example/app/core/shared/services/navigator_service.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(NavigatorService.navigatorKey);
    Modular.setInitialRoute('/rh/');
    // Modular.setInitialRoute('/fiscal/');
    // Modular.setInitialRoute('/fiscal/financial/');

    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
