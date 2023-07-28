import 'package:flutter/foundation.dart';
import 'package:person_manager2/app/modules/person/domain/usecases/get_persons_usecase.dart';
import 'package:person_manager2/app/modules/person/presenter/value_notifier/stores/states/persons_state.dart';

class PersonsStore extends ValueNotifier<PersonsState> {
  PersonsStore(this._getPersonsUsecase) : super(PersonsState.initState());

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> getPersons() async {
    value = const LoadingPersonsState();

    await Future.delayed(const Duration(seconds: 2));

    final result = await _getPersonsUsecase();

    result.fold(
      (success) => value = DataPersonsState(success),
      (failure) => value = ErrorPersonsState(failure),
    );
  }
}
