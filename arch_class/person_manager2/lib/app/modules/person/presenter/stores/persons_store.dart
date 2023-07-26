import 'package:flutter/foundation.dart';
import 'package:person_manager2/app/modules/person/domain/usecases/get_persons_usecase.dart';
import 'package:person_manager2/app/modules/person/presenter/stores/states/persons_state.dart';

import '../../../../core/exceptions/app_exception.dart';

class PersonsStore extends ValueNotifier<PersonsState> {
  PersonsStore(this._getPersonsUsecase) : super(PersonsState.initState());

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> getPersons() async {
    try {
      value = const LoadingPersonsState();

      await Future.delayed(const Duration(seconds: 2));

      final persons = await _getPersonsUsecase();

      value = DataPersonsState(persons);
    } on AppException catch (e) {
      value = ErrorPersonsState(e);
    }
  }
}
