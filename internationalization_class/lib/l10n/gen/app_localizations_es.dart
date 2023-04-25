import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => '¡Hola Mundo!';

  @override
  String get className => 'Clase de Internacionalización';

  @override
  String pageTitle(String pageName) {
    return '$pageName Página';
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
      other: 'Fue presionado $countString veces',
      one: 'Fue presionado 1 vez',
      zero: 'No fue presionado',
    );
    return '$_temp0';
  }
}
