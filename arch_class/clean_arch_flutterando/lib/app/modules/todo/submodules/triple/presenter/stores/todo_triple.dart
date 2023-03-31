import 'package:flutter_triple/flutter_triple.dart';

import '../../../../domain/failures/failures.dart';
import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';
import 'states/todo_triple_state.dart';

class TodoTriple extends NotifierStore<TodoFailure, TodoTripleState> {
  TodoTriple(this._getAllByUserIDUsecase) : super(TodoTripleState.initState());
  final GetAllByUserIDUsecase _getAllByUserIDUsecase;

  Future<void> getTodos(String userID) async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    final param = GetAllByUserIDParam(userID: userID);
    final result = await _getAllByUserIDUsecase(param);

    result.fold(
      setError, // tear-off
      (r) => update(TodoTripleState(r)),
    );

    setLoading(false);
  }
}
