import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/usecases.dart';
import 'events/form_bloc_event.dart';
import 'states/form_bloc_state.dart';

class FormBloc extends Bloc<FormBlocEvent, FormBlocState> {
  FormBloc(this._createTodoUsecase) : super(const InitialFormBlocState()) {
    on<CreateTodoFormBlocEvent>(_create);
  }
  final CreateTodoUsecase _createTodoUsecase;

  bool get isSuccess => state is SuccessFormBlocState;

  Future<void> _create(
    CreateTodoFormBlocEvent event,
    Emitter<FormBlocState> emitter,
  ) async {
    emitter(const LoadingFormBlocState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createTodoUsecase(event.param);

    result.fold(
      (l) => emitter(ErrorFormBlocState(l)),
      (r) => emitter(const SuccessFormBlocState()),
    );
  }
}
