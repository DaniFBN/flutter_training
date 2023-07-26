import 'dart:async';

import 'package:flutter/material.dart';

import '../exceptions/app_exception.dart';

typedef OnError = void Function(AppException exception);
typedef OnSuccess = FutureOr Function();

class CustomNotifier<T> extends ValueNotifier<T> {
  CustomNotifier(super.value);

  @protected
  FutureOr<void> execute(OnSuccess onSuccess, OnError onError) async {
    try {
      await onSuccess();
    } on AppException catch (e) {
      onError(e);
    }
  }
}
