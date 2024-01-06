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
      duration: const Duration(seconds: 5),
    );

    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );

    final opacityTween = Tween<double>(begin: 1, end: 0.3);
    opacityAnimation = opacityTween.animate(curvedAnimation);

    containerRadiusAnimation = Tween<double>(
      begin: 10,
      end: 100,
    ).animate(curvedAnimation);
    alignmentAnimation = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(curvedAnimation);

    rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
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
    // AnimationStatus.completed = Animação parou no final
    if (status == AnimationStatus.completed) {
      controller.reverse(); // Volta pro começo
      // AnimationStatus.dismissed = Animação parou no começo
    } else if (status == AnimationStatus.dismissed) {
      controller.forward(); // Vai pro final
    }
    // animationValue = 0;
    // controller.forward() > animationValue = 0 > 1
    // animationStatus = completed

    // animationValue = 1
    // controller.reverse() = 1 > 0
    // animationStatus = dismissed
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
          // print('REBUILD ANIMATION');

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

// Cada propriedade que deve mudar = Tween/Animation
//   Opacity - 1/0.3
//   Alignment - topCenter/bottomCenter
//   Radius - 10/50

// Cada gatilho/lógica/lifecycle = AnimationController
//   1 Controller


// Widget normais, envoltos em um AnimatedBuilder
//   AnimatedOpacity
//     AnimatedAlign

//   AnimatedBuilder
//     Opacity
//       Align




