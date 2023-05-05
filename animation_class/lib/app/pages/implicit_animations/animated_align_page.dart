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
          duration: const Duration(seconds: 10),
          opacity: isOpacity ? 0 : 1.0,
          child: AnimatedAlign(
            duration: const Duration(seconds: 5),
            curve: Curves.elasticIn,
            alignment:
                useFirstAlignment ? Alignment.topLeft : Alignment.bottomRight,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
