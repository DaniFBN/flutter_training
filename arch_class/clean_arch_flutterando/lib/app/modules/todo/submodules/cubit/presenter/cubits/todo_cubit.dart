import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';
import 'states/todo_cubit_state.dart';

class TodoCubit extends Cubit<TodoCubitState> {
  TodoCubit(this._getAllByUserIDUsecase) : super(const DataTodoCubitState({}));
  final GetAllByUserIDUsecase _getAllByUserIDUsecase;

  Future<void> getTodos(String userID) async {
    emit(const LoadingTodoCubitState());

    await Future.delayed(const Duration(seconds: 2));

    final param = GetAllByUserIDParam(userID: userID);
    final result = await _getAllByUserIDUsecase(param);

    result.fold(
      (l) => emit(ErrorTodoCubitState(l)),
      (r) => emit(DataTodoCubitState(r)),
    );
  }
}
