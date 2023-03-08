import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../intl_store.dart';

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
        child: Text(AppLocalizations.of(context).helloWorld),
      ),
    );
  }
}
