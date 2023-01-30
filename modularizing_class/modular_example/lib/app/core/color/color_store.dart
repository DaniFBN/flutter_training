import 'package:flutter/material.dart';

class ColorStore extends ValueNotifier<Color> {
  ColorStore() : super(Colors.white);

  Color get color => value;

  void updateColor(Color newColor) => value = newColor;

}
