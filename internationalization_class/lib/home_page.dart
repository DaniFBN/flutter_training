import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:internationalization_class/pages/calendar_picker_page.dart';
import 'package:internationalization_class/pages/counter_page.dart';
import 'package:internationalization_class/pages/hello_world_page.dart';

import 'intl_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: AppLocalizations.of(context).className,
      action: IconButton(
        icon: const Icon(Icons.translate_rounded),
        onPressed: IntlStore.instance.next,
      ),
      body: const DefaultMenu(
        options: [
          DefaultNavigationButton(
            page: HelloWorldPage(),
            title: 'Hello World',
          ),
          DefaultNavigationButton(
            page: CounterPage(),
            title: 'Counter Page',
          ),
          DefaultNavigationButton(
            page: CalendarPickerPage(),
            title: 'Calendar Picker Page',
          ),
        ],
      ),
    );
  }
}
