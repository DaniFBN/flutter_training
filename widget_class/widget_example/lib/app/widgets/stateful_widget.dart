// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CustomStatefulWidget extends StatefulWidget {
  const CustomStatefulWidget({super.key, required this.message});

  final String message;

  @override
  State<CustomStatefulWidget> createState() => _CustomStatefulWidgetState();
}

class _CustomStatefulWidgetState extends State<CustomStatefulWidget> {
  @override
  void didUpdateWidget(covariant CustomStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('LIFE-CYCLE-WIDGET: didUpdateWidget');
  }

  @override
  void deactivate() {
    print('LIFE-CYCLE-WIDGET: deactivate');

    super.deactivate();
  }

  @override
  void dispose() {
    print('LIFE-CYCLE-WIDGET: dispose');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('LIFE-CYCLE-WIDGET: build');

    return Text('STATEFUL-WIDGET-${widget.message}');
  }
}
