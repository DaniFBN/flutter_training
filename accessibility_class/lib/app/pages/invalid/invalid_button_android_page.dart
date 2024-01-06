import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
              height: _size,
              width: _size,
              child: GestureDetector(
                onTap: () {},
                onLongPress: () {},
                child: const Icon(Icons.error, semanticLabel: 'Ícone de erro'),
              ),
            ),
          if (showInkWell)
            SizedBox(
              height: _size,
              width: _size,
              child: Semantics(
                textDirection: TextDirection.ltr,
                container: true,
                button: true,
                attributedValue: AttributedString(AutofillHints.email),
                attributedHint: AttributedString(AutofillHints.addressCity),
                onLongPressHint: 'Teste',
                onLongPress: () => SemanticsService.announce(
                  'InkWell clicado',
                  TextDirection.ltr,
                ),
                child: InkWell(
                  // onTap: () {},
                  onLongPress: () {},
                  child:
                      const Icon(Icons.error, semanticLabel: 'Ícone de erro'),
                ),
              ),
            ),
          if (showIconButton)
            SizedBox(
              height: _size,
              width: _size,
              child: IconButton(
                onPressed: () {},
                iconSize: 20,
                icon: const Icon(
                  Icons.error,
                  semanticLabel: 'Icone',
                ),
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
