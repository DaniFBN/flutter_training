import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool useFirstColor = true;
  bool greater = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            useFirstColor = !useFirstColor;
            greater = !greater;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          height: greater ? 100 : 50,
          width: greater ? 100 : 50,
          decoration: BoxDecoration(
            color: useFirstColor ? Colors.red.shade300 : Colors.amber.shade300,
          ),
        ),
      ),
    );
  }
}
