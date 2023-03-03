import 'package:flutter/material.dart';

abstract class IConnectionService {
  ValueNotifier<bool> get hasConnection;
  void dispose();
}
