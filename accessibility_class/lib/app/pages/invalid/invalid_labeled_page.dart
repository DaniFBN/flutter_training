import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class InvalidLabeledPage extends StatelessWidget {
  const InvalidLabeledPage({
    super.key,
    this.showGesture = false,
    this.showInkWell = false,
    this.showIconButton = false,
    this.showTextButton = false,
    this.showElevatedButton = false,
    this.showOutlinedButton = false,
    this.showFab = false,
  });

  const InvalidLabeledPage.complete({
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

  final double _size = 52;

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
              height: _size,
              width: _size,
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
            IconButton(
              onPressed: () {},
              iconSize: 10,
              icon: const Icon(Icons.error),
              style: IconButton.styleFrom(
                fixedSize: Size(_size, _size),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          if (showTextButton)
            MergeSemantics(
              child: Semantics(
                value: 'Eu sou um botao',
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    fixedSize: Size(_size, _size),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Icon(
                    Icons.error,
                    semanticLabel: 'Icone de erro',
                  ),
                ),
              ),
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
