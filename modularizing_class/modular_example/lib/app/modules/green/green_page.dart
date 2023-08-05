import 'package:flutter/material.dart';
import 'package:modular_example/app/core/color/color_store.dart';

class GreenPage extends StatefulWidget {
  final ColorStore colorStore;

  const GreenPage({
    Key? key,
    required this.colorStore,
  }) : super(key: key);

  @override
  State<GreenPage> createState() => _GreenPageState();
}

class _GreenPageState extends State<GreenPage> {
  static const color = Colors.green;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.colorStore.updateColor(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), backgroundColor: color);
  }
}
