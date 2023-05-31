import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

import '../app_widget.dart';
import '../intl_store.dart';
import '../l10n/gen/app_localizations.dart';

class HelloWorldPage extends StatelessWidget {
  const HelloWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: AppLocalizations.of(context).pageTitle('"Hello World"'),
      action: IconButton(
        icon: const Icon(Icons.translate_rounded),
        onPressed: IntlStore.instance.next,
      ),
      body: Center(
        child: Column(
          children: [
            Text(AppLocalizations.of(context).helloWorld),
            Text(
              Localization().intl('hello', context),
            ),
          ],
        ),
      ),
    );
  }
}
