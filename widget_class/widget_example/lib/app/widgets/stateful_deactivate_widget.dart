import 'package:flutter/material.dart';

class StatefulDeactivateWidget extends StatefulWidget {
  const StatefulDeactivateWidget({super.key});

  @override
  State<StatefulDeactivateWidget> createState() =>
      _StatefulDeactivateWidgetState();
}

class _StatefulDeactivateWidgetState extends State<StatefulDeactivateWidget> {
  @override
  void deactivate() {
    print('LIFE-CYCLE-DEACTIVATE: deactivate');

    super.deactivate();
  }

  @override
  void dispose() {
    print('LIFE-CYCLE-DEACTIVATE: dispose');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Text('STATEFUL-WIDGET-DEACTIVATE');
  }
}
