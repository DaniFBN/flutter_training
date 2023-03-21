import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(NavigationService.instance.navigationKey);

    return MaterialApp.router(
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
