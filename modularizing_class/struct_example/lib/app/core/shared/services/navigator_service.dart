import 'package:flutter/material.dart';

class NavigatorService {
  const NavigatorService._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static void pushNamed(String name) {
    final state = navigatorKey.currentState!;
    state.pushNamed(name);
  }

  static void pushReplacementNamed(String name) {
    final state = navigatorKey.currentState!;
    state.pushReplacementNamed(name);
  }
}
