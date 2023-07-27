import 'package:flutter/foundation.dart';
import 'package:person_manager/app/core/failures/app_failure.dart';
import 'package:person_manager/app/modules/person/domain/usecases/get_persons_usecase.dart';

import 'states/persons_state.dart';

class PersonsStore extends ValueNotifier<PersonsState> {
  PersonsStore(
    this._getPersonsUsecase,
  ) : super(const DataPersonsState([]));

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> getPersons() async {
    value = const LoadingPersonsState();

    await Future.delayed(const Duration(seconds: 2));

    try {
      final persons = await _getPersonsUsecase();
      value = DataPersonsState(persons);
    } on AppFailure catch (failure) {
      value = ErrorPersonsState(failure);
    }
  }
}
