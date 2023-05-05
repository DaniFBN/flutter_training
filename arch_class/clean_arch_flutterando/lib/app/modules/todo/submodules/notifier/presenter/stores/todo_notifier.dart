import 'package:flutter/material.dart';

import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';
import 'states/todo_notifier_state.dart';

class TodoNotifier extends ValueNotifier<TodoNotifierState> {
  TodoNotifier(this._getAllByUserIDUsecase) : super(const DataTodoNotifierState({}));
  final GetAllByUserIDUsecase _getAllByUserIDUsecase;

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

// class TodoChangeNotifier extends ChangeNotifier {
//   final GetAllByUserIDUsecase _getAllByUserIDUsecase;

//   TodoChangeNotifier(this._getAllByUserIDUsecase);

//   TodoNotifierState get state => _state;
//   TodoNotifierState _state = const DataTodoNotifierState({});

//   Future<void> getTodos(String userID) async {
//     _state = const LoadingTodoNotifierState();
//     notifyListeners();

//     await Future.delayed(const Duration(seconds: 2));

//     final param = GetAllByUserIDParam(userID: userID);
//     final result = await _getAllByUserIDUsecase(param);

//     result.fold(
//       (l) => _state = ErrorTodoNotifierState(l),
//       (r) => _state = DataTodoNotifierState(r),
//     );
//     notifyListeners();
//   }
// }
