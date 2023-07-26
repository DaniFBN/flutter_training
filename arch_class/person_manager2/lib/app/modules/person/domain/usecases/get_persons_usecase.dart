import 'package:person_manager2/app/core/exceptions/app_exception.dart';
import 'package:person_manager2/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager2/app/modules/person/domain/repositories/person_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class IGetPersonsUsecase {
  AsyncResult<List<PersonEntity>, AppException> call();
}

class GetPersonsUsecase implements IGetPersonsUsecase {
  final IPersonRepository _repository;

  const GetPersonsUsecase(this._repository);

  @override
  AsyncResult<List<PersonEntity>, AppException> call() {
    return _repository.getPersons();
  }
}
