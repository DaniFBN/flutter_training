import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({super.key});

  @override
  State<AnimatedAlignPage> createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  bool useFirstAlignment = true;
  bool isOpacity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedAlign')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            useFirstAlignment = !useFirstAlignment;
            isOpacity = !isOpacity;
          });
        },
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: isOpacity ? 0.0 : 1.0,
          child: AnimatedAlign(
            duration: const Duration(seconds: 2),
            alignment: useFirstAlignment
                ? Alignment.topCenter
                : Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red.shade300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
