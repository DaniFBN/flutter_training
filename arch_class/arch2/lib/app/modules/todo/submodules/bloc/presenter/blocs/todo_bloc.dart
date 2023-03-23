import 'package:arch2/app/modules/todo/submodules/bloc/presenter/blocs/events/todo_bloc_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';
import 'states/todo_bloc_state.dart';

class TodoBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  final GetAllByUserIDUsecase _getAllByUserIDUsecase;

  TodoBloc(this._getAllByUserIDUsecase) : super(const DataTodoBlocState({})) {
    on<GetAllTodoBlocEvent>(_getTodos);
  }

  Future<void> _getTodos(
    GetAllTodoBlocEvent event,
    Emitter<TodoBlocState> emitter,
  ) async {
    emitter(const LoadingTodoBlocState());

    await Future.delayed(const Duration(seconds: 2));

    final param = GetAllByUserIDParam(userID: event.userID);
    final result = await _getAllByUserIDUsecase(param);

    result.fold(
      (l) => emitter(ErrorTodoBlocState(l)),
      (r) => emitter(DataTodoBlocState(r)),
    );
  }
}
