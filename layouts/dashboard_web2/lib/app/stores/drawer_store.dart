import 'package:flutter/material.dart';

enum DrawerState {
  open(250),
  closed(80);

  bool get isOpen => this == DrawerState.open;

  const DrawerState(this.width);

  final double width;
}

class DrawerStore extends ValueNotifier<DrawerState> {
  DrawerStore() : super(DrawerState.open);

  void toggle() {
    var newState = DrawerState.open;
    if (value == DrawerState.open) {
      newState = DrawerState.closed;
    }

    value = newState;
  }
}

final drawerStore = DrawerStore();
