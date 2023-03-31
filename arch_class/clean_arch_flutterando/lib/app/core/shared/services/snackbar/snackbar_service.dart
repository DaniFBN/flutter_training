import 'package:flutter/material.dart';

class SnackBarService {
  SnackBarService._(this.scaffoldMessengerKey);
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  static final instance =
      SnackBarService._(GlobalKey<ScaffoldMessengerState>());

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));

    scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }
}
