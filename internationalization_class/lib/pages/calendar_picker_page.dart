import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:internationalization_class/l10n/l10n.dart';

import '../intl_store.dart';

class CalendarPickerPage extends StatelessWidget {
  const CalendarPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: context.l10n.pageTitle('"Calendar Picker"'),
      action: IconButton(
        icon: const Icon(Icons.translate_rounded),
        onPressed: IntlStore.instance.next,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Localizations.override(
              context: context,
              locale: const Locale('fr'),
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                onDateChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
