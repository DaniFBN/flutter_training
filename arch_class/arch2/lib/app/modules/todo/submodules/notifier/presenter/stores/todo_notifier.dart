import 'package:flutter/material.dart';

import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';
import 'states/todo_notifier_state.dart';

class TodoNotifier extends ValueNotifier<TodoNotifierState> {
  final GetAllByUserIDUsecase _getAllByUserIDUsecase;

  TodoNotifier(this._getAllByUserIDUsecase)
      : super(const DataTodoNotifierState({}));

  Future<void> getTodos(String userID) async {
    value = const LoadingTodoNotifierState();

    await Future.delayed(const Duration(seconds: 2));

    final param = GetAllByUserIDParam(userID: userID);
    final result = await _getAllByUserIDUsecase(param);

    result.fold(
      (l) => value = ErrorTodoNotifierState(l),
      (r) => value = DataTodoNotifierState(r),
    );
  }
}
