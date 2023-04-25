import 'package:flutter/material.dart';

import 'app_localizations.dart';

extension Localization on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
