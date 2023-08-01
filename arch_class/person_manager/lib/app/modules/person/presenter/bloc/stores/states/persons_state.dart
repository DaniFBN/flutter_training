import 'package:person_manager/app/core/failures/app_failure.dart';
import 'package:person_manager/app/modules/person/domain/entities/person_entity.dart';

sealed class PersonsState {
  const PersonsState();
}

class LoadingPersonsState extends PersonsState {
  const LoadingPersonsState();
}

class DataPersonsState extends PersonsState {
  final List<PersonEntity> persons;

  const DataPersonsState(this.persons);
}

class ErrorPersonsState extends PersonsState {
  final AppFailure failure;

  const ErrorPersonsState(this.failure);
}
