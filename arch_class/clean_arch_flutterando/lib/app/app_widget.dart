import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'core/modules/theme/presenter/stores/theme_store.dart';
import 'core/shared/services/navigation_service.dart';
import 'core/shared/services/snackbar/snackbar_service.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final SnackBarService snackBarService;

  @override
  void initState() {
    super.initState();

    Modular.setNavigatorKey(NavigationService.instance.navigationKey);
    snackBarService = Modular.get<SnackBarService>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Modular.isModuleReady<AppModule>(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final themeStore = Modular.get<ThemeStore>()..getTheme();

          return ValueListenableBuilder(
            valueListenable: themeStore.selectState,
            builder: (context, state, __) {
              return MaterialApp.router(
                routerDelegate: Modular.routerDelegate,
                routeInformationParser: Modular.routeInformationParser,
                scaffoldMessengerKey: snackBarService.scaffoldMessengerKey,
                title: 'Clean Arch Flutterando',
                debugShowCheckedModeBanner: false,
                themeMode: themeStore.isDark ? ThemeMode.dark : ThemeMode.light,
                darkTheme: ThemeData.dark(useMaterial3: true),
                theme: ThemeData.light(useMaterial3: true),
              );
            },
          );
        }

        return MaterialApp(
          title: 'Clean Arch Flutterando',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(useMaterial3: true),
          theme: ThemeData.light(useMaterial3: true),
          home: const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
