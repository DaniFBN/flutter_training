import 'package:flutter/material.dart';

import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';
import 'states/form_notifier_state.dart';

class FormNotifier extends ValueNotifier<FormNotifierState> {
  final CreateTodoUsecase _createTodoUsecase;

  FormNotifier(this._createTodoUsecase)
      : super(const InitialFormNotifierState());

  bool get isSuccess => value is SuccessFormNotifierState;
  bool get hasError => value is ErrorFormNotifierState;

  Future<void> create(CreateTodoParam param) async {
    value = const LoadingFormNotifierState();

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createTodoUsecase(param);

    result.fold(
      (l) => value = ErrorFormNotifierState(l),
      (r) => value = const SuccessFormNotifierState(),
    );
  }
}
