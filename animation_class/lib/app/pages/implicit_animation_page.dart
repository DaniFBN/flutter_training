// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({super.key});

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage> {
  bool useFirstColor = true;
  bool greater = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Implicit Animation')),
      body: Row(
        children: [
          AnimationCardWidget(
            title: 'Implicit Container',
            child: GestureDetector(
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
                  color: useFirstColor
                      ? Colors.red.shade300
                      : Colors.amber.shade300,
                ),
              ),
            ),
          ),
          AnimationCardWidget(
            title: 'Implicit Container',
            child: GestureDetector(
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
                  color: useFirstColor
                      ? Colors.red.shade300
                      : Colors.amber.shade300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimationCardWidget extends StatelessWidget {
  final Widget child;
  final String title;

  const AnimationCardWidget({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: const TextStyle(fontSize: 16)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
