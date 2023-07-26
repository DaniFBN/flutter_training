import 'package:flutter/material.dart';

abstract interface class ISnackBarService {
  Future<void> showSnackBar(SnackBar snackBar);
}
