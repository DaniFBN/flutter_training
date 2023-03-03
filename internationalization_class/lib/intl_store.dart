import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntlStore extends ValueNotifier<Locale> {
  IntlStore._() : super(AppLocalizations.supportedLocales.first);

  static final IntlStore instance = IntlStore._();

  void next() {
    final currentIndex = AppLocalizations.supportedLocales.indexOf(value);

    int nextIndex = currentIndex + 1;

    if ((currentIndex + 1) == AppLocalizations.supportedLocales.length) {
      nextIndex = 0;
    }

    final nextLocale = AppLocalizations.supportedLocales.elementAt(nextIndex);
    value = nextLocale;
  }
}
