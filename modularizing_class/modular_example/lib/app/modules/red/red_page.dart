import 'package:flutter/material.dart';
import 'package:modular_example/app/core/color/color_store.dart';

class RedPage extends StatefulWidget {
  final ColorStore colorStore;

  const RedPage({
    Key? key,
    required this.colorStore,
  }) : super(key: key);

  @override
  State<RedPage> createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> {
  static const color = Colors.redAccent;

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
