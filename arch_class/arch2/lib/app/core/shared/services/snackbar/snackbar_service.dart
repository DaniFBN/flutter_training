import 'package:flutter/material.dart';

class SnackBarService {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  SnackBarService._(this.scaffoldMessengerKey);

  static final instance =
      SnackBarService._(GlobalKey<ScaffoldMessengerState>());

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));

    scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }
}
