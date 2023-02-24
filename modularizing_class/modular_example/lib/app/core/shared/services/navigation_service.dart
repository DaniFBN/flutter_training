import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigationService {
  final key = GlobalKey<NavigatorState>();
  static NavigationService instance = NavigationService._();

  NavigationService._();

  void pushNamed(String path, {Object? arguments}) {
    Modular.to.pushNamed(path, arguments: arguments);
  }
}
