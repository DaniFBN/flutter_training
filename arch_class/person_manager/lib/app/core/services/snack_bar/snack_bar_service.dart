import 'package:flutter/material.dart';

abstract interface class ISnackBarService {
  void showSnackBar(SnackBar snackBar);
  void dispose();
}
