import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class InvalidButtonAndroidPage extends StatelessWidget {
  const InvalidButtonAndroidPage({
    super.key,
    this.showGesture = false,
    this.showInkWell = false,
    this.showIconButton = false,
    this.showTextButton = false,
    this.showElevatedButton = false,
    this.showOutlinedButton = false,
    this.showFab = false,
  });

  const InvalidButtonAndroidPage.complete({
    super.key,
    this.showGesture = true,
    this.showInkWell = true,
    this.showIconButton = true,
    this.showTextButton = true,
    this.showElevatedButton = true,
    this.showOutlinedButton = true,
    this.showFab = true,
  });

  final bool showGesture;
  final bool showInkWell;
  final bool showIconButton;
  final bool showTextButton;
  final bool showElevatedButton;
  final bool showOutlinedButton;
  final bool showFab;

  final double _size = 20;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: runtimeType.toString(),
      fab: showFab
          ? FloatingActionButton(
              onPressed: () {},
              mini: true,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            )
          : Container(),
      body: Column(
        children: [
          if (showGesture)
            SizedBox(
              height: 50,
              width: 50,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.error),
              ),
            ),
          if (showInkWell)
            SizedBox(
              height: _size,
              width: _size,
              child: InkWell(
                onTap: () {},
                child: const Icon(Icons.error),
              ),
            ),
          if (showIconButton)
            SizedBox(
              height: _size,
              width: _size,
              child: IconButton(
                onPressed: () {},
                iconSize: 10,
                icon: const Icon(Icons.error),
                style: IconButton.styleFrom(
                  fixedSize: Size(_size, _size),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          if (showTextButton)
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                fixedSize: Size(_size, _size),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Icon(Icons.error),
            ),
          if (showElevatedButton)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(_size, _size),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Icon(Icons.error),
            ),
          if (showOutlinedButton)
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                fixedSize: Size(_size, _size),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Icon(Icons.error),
            ),
        ],
      ),
    );
  }
}
