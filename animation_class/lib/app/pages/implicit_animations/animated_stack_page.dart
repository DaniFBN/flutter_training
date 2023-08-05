import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  const AnimatedPositionedPage({super.key});

  @override
  State<AnimatedPositionedPage> createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  double? _containerTopValue;
  double? _containerLeftValue;
  final _randomNumberGenerator = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedPositioned"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxHeight,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "AnimatedPositioned allows us to set animations when we want to change the parameters of a Positioned, which gives you the power to put a widget in any place of the screen using its parameters rigth, left, top and bottom.",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Tap the blue container and you'll see that it can be in any pixel of the screen using a smooth transition animation. To return the container to the initial position, just press the reset button.",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                _animatedPositionedContainer(constraints, context),
                _resetButton(constraints)
              ],
            ),
          );
        },
      ),
    );
  }

  Align _resetButton(BoxConstraints constraints) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton.extended(
        label: const Text("Reset"),
        onPressed: () {
          setState(() {
            _containerLeftValue = null;
            _containerTopValue = null;
          });
        },
      ),
    );
  }

  AnimatedPositioned _animatedPositionedContainer(
    BoxConstraints constraints,
    BuildContext context,
  ) {
    return AnimatedPositioned(
      top: _containerTopValue ?? (constraints.maxHeight / 2) - 50,
      left: _containerLeftValue ?? (constraints.maxWidth / 2) - 50,
      duration: const Duration(seconds: 5),
      child: InkWell(
        child: Container(
          color: Theme.of(context).primaryColor,
          height: 50,
          width: 50,
          child: const Center(
            child: Text(
              "Hover me!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          print('tapped');
        },
        onHover: (bool isHover) {
          setState(() {
            _containerLeftValue =
                _randomNumberGenerator.nextInt(200).toDouble();
            _containerTopValue = _randomNumberGenerator.nextInt(300).toDouble();
          });
        },
      ),
    );
  }
}
