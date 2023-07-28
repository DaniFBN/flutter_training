import 'package:flutter/material.dart';

abstract base class ValueObject<T extends Object> {
  final T value;

  ValueObject(this.value) {
    validate();
  }

  void validate();

  String? _error;
  String? get error => _error;

  @protected
  String setError(String error) => _error = error;
  bool get hasError => _error != null;
}
