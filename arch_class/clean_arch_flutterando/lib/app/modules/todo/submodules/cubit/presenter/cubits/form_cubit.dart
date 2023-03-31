import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/params/params.dart';
import '../../../../domain/usecases/usecases.dart';
import 'states/form_cubit_state.dart';

class FormCubit extends Cubit<FormCubitState> {
  FormCubit(this._createTodoUsecase) : super(const InitialFormCubitState());

  final CreateTodoUsecase _createTodoUsecase;

  bool get isSuccess => state is SuccessFormCubitState;

  Future<void> create(CreateTodoParam param) async {
    emit(const LoadingFormCubitState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createTodoUsecase(param);

    result.fold(
      (l) => emit(ErrorFormCubitState(l)),
      (r) => emit(const SuccessFormCubitState()),
    );
  }
}
