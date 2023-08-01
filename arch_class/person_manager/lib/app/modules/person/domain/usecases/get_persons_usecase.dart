import 'package:person_manager/app/core/failures/app_failure.dart';
import 'package:person_manager/app/modules/person/domain/entities/person_entity.dart';
import 'package:result_dart/result_dart.dart';

import '../repositories/person_repository.dart';

// Command Pattern
abstract interface class IGetPersonsUsecase {
  AsyncResult<List<PersonEntity>, AppFailure> call();
}

class GetPersonsUsecase implements IGetPersonsUsecase {
  final IPersonRepository _repository;

  const GetPersonsUsecase(this._repository);

  @override
  AsyncResult<List<PersonEntity>, AppFailure> call() async {
    return _repository.getPersons();
  }
}
