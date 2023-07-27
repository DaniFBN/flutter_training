import 'package:person_manager/app/modules/person/domain/entities/person_entity.dart';

import '../repositories/person_repository.dart';

// Command Pattern
abstract interface class IGetPersonsUsecase {
  Future<List<PersonEntity>> call();
}

class GetPersonsUsecase implements IGetPersonsUsecase {
  final IPersonRepository _repository;

  const GetPersonsUsecase(this._repository);

  @override
  Future<List<PersonEntity>> call() async {
    return _repository.getPersons();
  }
}
