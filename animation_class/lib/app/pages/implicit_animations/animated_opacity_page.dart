import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedOpacity')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isOpacity = !isOpacity;
          });
        },
        child: AnimatedOpacity(
          duration: const Duration(seconds: 5),
          opacity: isOpacity ? 0.5 : 1.0,
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
