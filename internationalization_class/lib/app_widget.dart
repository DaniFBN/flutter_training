import 'package:flutter/material.dart';
import 'package:internationalization_class/l10n/gen/app_localizations.dart';

import 'home_page.dart';
import 'intl_store.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: IntlStore.instance,
      builder: (_, locale, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // localizationsDelegates: const [
          //   AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          // supportedLocales: const [
          //   Locale('en'), // English
          //   Locale('es'), // Spanish
          //   Locale('pt'), // Portuguese
          // ],
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          home: const HomePage(),
        );
      },
    );
  }
}

final en = {'hello': 'Hello World!'};
final es = {'hello': '¡Hola Mundo!'};
final ptBr = {'hello': 'Olá Mundo'};
