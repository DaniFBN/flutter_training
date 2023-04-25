import 'package:flutter/cupertino.dart';

import '../l10n/gen/app_localizations.dart';

class IntlStore extends ValueNotifier<Locale> {
  IntlStore._() : super(AppLocalizations.supportedLocales.first);

  static final IntlStore instance = IntlStore._();

  void next() {
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentIndex = supportedLocales.indexOf(value);

    int nextIndex = currentIndex + 1;

    if (nextIndex == supportedLocales.length) {
      nextIndex = 0;
    }

    final nextLocale = supportedLocales.elementAt(nextIndex);
    value = nextLocale;
  }
}
