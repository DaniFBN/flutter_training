import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_persons_usecase.dart';
import 'events/persons_event.dart';
import 'states/persons_state.dart';

class PersonsStore extends Bloc<PersonsEvent, PersonsState> {
  PersonsStore(
    this._getPersonsUsecase,
  ) : super(const DataPersonsState([])) {
    on<GetPersonsEvent>((event, emit) => _getPersons(emit));
  }

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> _getPersons(Emitter<PersonsState> emit) async {
    emit(const LoadingPersonsState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _getPersonsUsecase();

    result.fold(
      (success) => emit(DataPersonsState(success)),
      (failure) => emit(ErrorPersonsState(failure)),
    );
  }
}
