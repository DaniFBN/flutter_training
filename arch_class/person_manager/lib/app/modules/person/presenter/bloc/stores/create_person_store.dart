import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_manager/app/modules/person/presenter/bloc/stores/events/create_person_event.dart';

import '../../../domain/usecases/create_person_usecase.dart';
import 'states/create_person_state.dart';

class CreatePersonStore extends Bloc<CreatePersonEvent, CreatePersonState> {
  CreatePersonStore(
    this._createPersonUsecase,
  ) : super(const InitialCreatePersonState()) {
    on<SubmitCreatePersonEvent>(_create);
  }

  final ICreatePersonUsecase _createPersonUsecase;

  Future<void> _create(
    SubmitCreatePersonEvent event,
    Emitter<CreatePersonState> emit,
  ) async {
    emit(const LoadingCreatePersonState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createPersonUsecase(event.param);

    result.fold(
      (success) => emit(const SuccessCreatePersonState()),
      (failure) => emit(ErrorCreatePersonState(failure)),
    );
  }
}
