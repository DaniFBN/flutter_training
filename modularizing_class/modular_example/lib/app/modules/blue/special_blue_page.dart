import 'package:flutter/material.dart';
import 'package:modular_example/app/core/color/color_store.dart';

class SpecialBluePage extends StatefulWidget {
  final ColorStore colorStore;

  const SpecialBluePage({
    Key? key,
    required this.colorStore,
  }) : super(key: key);

  @override
  State<SpecialBluePage> createState() => _SpecialBluePageState();
}

class _SpecialBluePageState extends State<SpecialBluePage> {
  final color = Colors.indigo.shade400;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.colorStore.updateColor(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: color);
  }
}
