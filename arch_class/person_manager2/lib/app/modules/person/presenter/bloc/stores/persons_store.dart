import 'package:bloc/bloc.dart';
import 'package:person_manager2/app/modules/person/domain/usecases/get_persons_usecase.dart';
import 'package:person_manager2/app/modules/person/presenter/bloc/stores/events/persons_event.dart';
import 'package:person_manager2/app/modules/person/presenter/bloc/stores/states/persons_state.dart';

class PersonsStore extends Bloc<PersonsEvent, PersonsState> {
  PersonsStore(this._getPersonsUsecase) : super(PersonsState.initState()) {
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
