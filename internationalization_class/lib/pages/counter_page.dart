import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../intl_store.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: AppLocalizations.of(context).pageTitle('"Counter Page"'),
      action: IconButton(
        icon: const Icon(Icons.translate_rounded),
        onPressed: IntlStore.instance.next,
      ),
      body: Center(
        child: Text(
          AppLocalizations.of(context).buttonIsTapped(_counter),
        ),
      ),
      fab: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
