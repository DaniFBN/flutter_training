import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    // final navigatorKey = GlobalKey<NavigatorState>();
    // navigatorKey.currentState.push(route);

    // Modular.setNavigatorKey(navigatorKey);

    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
