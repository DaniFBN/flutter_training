import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/failures/failures.dart';
import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';
import 'events/todo_bloc_event.dart';
import 'states/todo_bloc_state.dart';

class TodoBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBloc(this._getAllByUserIDUsecase) : super(const DataTodoBlocState({})) {
    on<GetAllTodoBlocEvent>(_getTodos);
  }
  final GetAllByUserIDUsecase _getAllByUserIDUsecase;

  Future<void> _getTodos(
    GetAllTodoBlocEvent event,
    Emitter<TodoBlocState> emitter,
  ) async {
    emitter(const LoadingTodoBlocState());

    await Future.delayed(const Duration(seconds: 2));

    // try {
    //   final param = GetAllByUserIDParam(userID: event.userID);
    //   final result = await _getAllByUserIDUsecase(param);
    //   emitter(DataTodoBlocState(result));
    // } on TodoFailure catch (e) {
    //   emitter(ErrorTodoBlocState(e));
    // }

    final param = GetAllByUserIDParam(userID: event.userID);
    final result = await _getAllByUserIDUsecase(param);

    result.fold(
      (l) => emitter(ErrorTodoBlocState(l)),
      (r) => emitter(DataTodoBlocState(r)),
    );
  }
}
