import 'dart:math';

import 'package:flutter/material.dart';

Color generateRandomColor() {
  final random = Random();

  final r = random.nextInt(255);
  final g = random.nextInt(255);
  final b = random.nextInt(255);

  return Color.fromRGBO(r, g, b, 1);
}

class RandomContainer extends StatelessWidget {
  const RandomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: generateRandomColor(),
    );
  }
}
