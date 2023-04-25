import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get helloWorld => 'Olá Mundo!';

  @override
  String get className => 'Aula de Internacionalização';

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
      other: 'Foi pressionado $countString vezes',
      one: 'Foi pressionado 1 vez',
      zero: 'Não foi pressionado',
    );
    return '$_temp0';
  }
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr(): super('pt_BR');

  @override
  String get helloWorld => 'Olá Mundo! - BR';

  @override
  String get className => 'Aula de Internacionalização - BR';

  @override
  String pageTitle(String pageName) {
    return '$pageName Página - BR';
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
      other: 'Foi pressionado $countString vezes',
      one: 'Foi pressionado 1 vez',
      zero: 'Não foi pressionado',
    );
    return '$_temp0';
  }
}
