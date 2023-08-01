import 'package:flutter/material.dart';
import 'package:person_manager/app/core/services/snack_bar/snack_bar_service.dart';

class MessengerSnackBarService implements ISnackBarService {
  final key = GlobalKey<ScaffoldMessengerState>();

  @override
  void dispose() {
    key.currentState?.removeCurrentSnackBar();
  }

  @override
  void showSnackBar(SnackBar snackBar) {
    key.currentState?.showSnackBar(snackBar);
  }
}
