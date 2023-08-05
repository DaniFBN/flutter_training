import 'package:flutter/material.dart';
import 'package:modular_example/app/core/color/color_store.dart';

class RandomPage extends StatefulWidget {
  final ColorStore colorStore;
  final Color color;

  const RandomPage({
    Key? key,
    required this.colorStore,
    required this.color,
  }) : super(key: key);

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.colorStore.updateColor(widget.color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), backgroundColor: widget.color);
  }
}
