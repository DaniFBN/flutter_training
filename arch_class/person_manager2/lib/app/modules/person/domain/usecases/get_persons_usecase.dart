import 'package:person_manager2/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager2/app/modules/person/domain/repositories/person_repository.dart';

abstract interface class IGetPersonsUsecase {
  Future<List<PersonEntity>> call();
}

class GetPersonsUsecase implements IGetPersonsUsecase {
  final IPersonRepository _repository;

  const GetPersonsUsecase(this._repository);

  @override
  Future<List<PersonEntity>> call() {
    return _repository.getPersons();
  }
}
