import 'package:flutter/material.dart';
import 'package:modular_example/app/core/color/color_store.dart';

class BluePage extends StatefulWidget {
  final ColorStore colorStore;

  const BluePage({
    Key? key,
    required this.colorStore,
  }) : super(key: key);

  @override
  State<BluePage> createState() => _BluePageState();
}

class _BluePageState extends State<BluePage> {
  static const color = Colors.blue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.colorStore.updateColor(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: color);
  }
}
