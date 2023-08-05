import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool useFirstColor = true;
  bool greater = true;

  double get containerSize => greater ? 300 : 100;
  Color get containerColor {
    if (useFirstColor) return Colors.red.shade300;
    return Colors.green.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'AnimatedContainer',
      body: GestureDetector(
        onTap: () {
          setState(() {
            useFirstColor = !useFirstColor;
            greater = !greater;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 4),
          height: containerSize,
          width: containerSize,
          color: containerColor,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('assets/images/user_image.jpeg'),
          ),
        ),
      ),
    );
  }
}
