import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._() : navigationKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> navigationKey;

  static NavigationService instance = NavigationService._();

  void push(String route, {Object? arguments}) {
    navigationKey.currentState!.pushNamed(route, arguments: arguments);
  }

  void pushReplacement(String route) {
    navigationKey.currentState!.pushNamed(route);
  }

  void pop() {
    navigationKey.currentState!.pop();
  }
}
