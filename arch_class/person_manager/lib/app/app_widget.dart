import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/core/services/snack_bar/messenger_snack_bar_service.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();

    // Modular.setNavigatorKey(NavigatorService.instance.key);
    Modular.setInitialRoute('/');
  }

  @override
  Widget build(BuildContext context) {
    final snackBarService = Modular.get<MessengerSnackBarService>();

    return MaterialApp.router(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      scaffoldMessengerKey: snackBarService.key,
    );
  }
}
