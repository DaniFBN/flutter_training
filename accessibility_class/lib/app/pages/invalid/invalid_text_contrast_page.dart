import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class InvalidTextContrastPage extends StatelessWidget {
  const InvalidTextContrastPage({
    super.key,
    this.showWhite = false,
    this.showRed = false,
    this.showYellow = false,
    this.showBlack = false,
  });

  const InvalidTextContrastPage.complete({
    super.key,
    this.showWhite = true,
    this.showRed = true,
    this.showYellow = true,
    this.showBlack = true,
  });

  final bool showWhite;
  final bool showRed;
  final bool showYellow;
  final bool showBlack;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: runtimeType.toString(),
      body: Column(
        children: [
          if (showWhite)
            const Text(
              'Bad Color Text',
              style: TextStyle(color: Colors.white),
            ),
          // if (showWhite)
          // Container(
          //   color: Colors.black,
          //   child: const Padding(
          //     padding: EdgeInsets.all(0.0),
          //     child: Text(
          //       'Bad Color Text',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // ),
          if (showRed)
            const Text(
              'Bad Color Text',
              style: TextStyle(color: Colors.red),
            ),
          if (showYellow)
            const Text(
              'Bad Color Text',
              style: TextStyle(color: Colors.yellow),
            ),
          if (showBlack)
            const Text(
              'Bad Color Text',
              style: TextStyle(color: Colors.black),
            ),
        ],
      ),
    );
  }
}
