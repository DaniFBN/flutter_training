import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get className => 'Internationalization Class';

  @override
  String pageTitle(String pageName) {
    return '$pageName Page';
  }

  @override
  String buttonIsTapped(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Was pressed $countString times',
      one: 'Was pressed 1 time',
      zero: 'Was not pressed',
    );
    return '$_temp0';
  }
}
