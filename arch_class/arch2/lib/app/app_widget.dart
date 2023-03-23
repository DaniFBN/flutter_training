import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/shared/services/snackbar/snackbar_service.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(NavigationService.instance.navigationKey);
    final snackBarService = Modular.get<SnackBarService>();

    return MaterialApp.router(
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      scaffoldMessengerKey: snackBarService.scaffoldMessengerKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
