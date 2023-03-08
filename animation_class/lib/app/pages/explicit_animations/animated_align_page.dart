import 'dart:math';

import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class AnimatedAlignExplicitPage extends StatefulWidget {
  const AnimatedAlignExplicitPage({super.key});

  @override
  State<AnimatedAlignExplicitPage> createState() =>
      _AnimatedAlignExplicitPageState();
}

class _AnimatedAlignExplicitPageState extends State<AnimatedAlignExplicitPage>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> opacityAnimation;
  late final Animation<double> containerRadiusAnimation;
  late final Animation<Alignment> alignmentAnimation;

  late final AnimationController rotateController;
  late final Animation<double> rotateAnimation;

  void animationTap() {
    if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    opacityAnimation = Tween<double>(begin: 1, end: 0.3).animate(controller);
    containerRadiusAnimation = Tween<double>(
      begin: 10,
      end: 100,
    ).animate(controller);
    alignmentAnimation = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(controller);

    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    rotateAnimation = Tween<double>(
      begin: 0,
      end: pi * 2,
    ).animate(rotateController);
    rotateController.repeat();

    controller.addStatusListener(infinityRotation);
    controller.forward();
  }

  void infinityRotation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.removeStatusListener(infinityRotation);
    controller.dispose();

    rotateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'AnimatedAlign',
      body: AnimatedBuilder(
        animation: Listenable.merge([controller, rotateController]),
        builder: (context, child) {
          return GestureDetector(
            onTap: animationTap,
            child: Opacity(
              opacity: opacityAnimation.value,
              child: Align(
                alignment: alignmentAnimation.value,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(
                      containerRadiusAnimation.value,
                    ),
                  ),
                  child: Transform.rotate(
                    angle: rotateAnimation.value,
                    child: const Icon(Icons.refresh),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
