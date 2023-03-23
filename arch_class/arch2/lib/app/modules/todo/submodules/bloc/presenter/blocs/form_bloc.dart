import 'package:arch2/app/modules/todo/submodules/bloc/presenter/blocs/events/form_bloc_event.dart';
import 'package:arch2/app/modules/todo/submodules/bloc/presenter/blocs/states/form_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/usecases.dart';

class FormBloc extends Bloc<FormBlocEvent, FormBlocState> {
  final CreateTodoUsecase _createTodoUsecase;

  FormBloc(this._createTodoUsecase) : super(const InitialFormBlocState()) {
    on<CreateTodoFormBlocEvent>(_create);
  }

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
