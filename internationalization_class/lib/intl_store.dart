import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntlStore extends ValueNotifier<Locale> {
  IntlStore._() : super(AppLocalizations.supportedLocales.first);

  static final IntlStore instance = IntlStore._();

  void next() {
    const supportedLocales = AppLocalizations.supportedLocales;
    final currentIndex = supportedLocales.indexOf(value);

    int nextIndex = currentIndex + 1;

    if ((currentIndex + 1) == supportedLocales.length) {
      nextIndex = 0;
    }

    final nextLocale = supportedLocales.elementAt(nextIndex);
    value = nextLocale;
  }
}
