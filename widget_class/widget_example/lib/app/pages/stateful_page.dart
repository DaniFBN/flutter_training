// ignore_for_file: avoid_print,no_logic_in_create_state

import 'package:flutter/material.dart';

import '../stores/theme_store.dart';
import '../widgets/stateful_deactivate_widget.dart';
import '../widgets/stateful_widget.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({super.key, required this.themeStore});

  final ThemeStore themeStore;

  @override
  State<StatefulPage> createState() {
    print('LIFE-CYCLE-PAGE: createState');

    return _StatefulPageState();
  }
}

class _StatefulPageState extends State<StatefulPage> {
  final showFirst = ValueNotifier(true);
  final showFirstMessage = ValueNotifier(true);
  final widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    print('LIFE-CYCLE-PAGE: initState');
  }

  @override
  void didChangeDependencies() {
    print('LIFE-CYCLE-PAGE: didChangeDependencies');

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefulPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('LIFE-CYCLE-PAGE: didUpdateWidget');
  }

  @override
  void deactivate() {
    print('LIFE-CYCLE-PAGE: deactivate');

    super.deactivate();
  }

  @override
  void dispose() {
    print('LIFE-CYCLE-PAGE: dispose');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('LIFE-CYCLE-PAGE: build');

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: showFirst,
              child: StatefulDeactivateWidget(key: deactivateKey),
              builder: (_, show, child) {
                if (show) return child!;

                return const SizedBox();
              },
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: showFirstMessage,
              builder: (_, show, __) {
                return CustomStatefulWidget(
                  message: show ? 'First message' : 'Second message',
                );
              },
            ),
            const SizedBox(height: 8),
            DefaultLifeCycleButton(
              message: 'Rebuild',
              onPressed: () {
                setState(() {});
              },
            ),
            DefaultLifeCycleButton(
              message: 'didChangeDependencies',
              onPressed: () {
                widget.themeStore.toggle();
              },
            ),
            DefaultLifeCycleButton(
              message: 'didUpdateWidget',
              onPressed: () {
                showFirstMessage.value = !showFirstMessage.value;
              },
            ),
            DefaultLifeCycleButton(
              message: 'Deactivate',
              onPressed: () {
                showFirst.value = !showFirst.value;
              },
            ),
            DefaultLifeCycleButton(
              message: 'Dispose',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ValueListenableBuilder(
              valueListenable: showFirst,
              child: StatefulDeactivateWidget(key: deactivateKey),
              builder: (_, show, child) {
                if (!show) return child!;

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

final deactivateKey = GlobalKey();

class DefaultLifeCycleButton extends StatelessWidget {
  const DefaultLifeCycleButton({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(message),
      ),
    );
  }
}
