import 'package:person_manager2/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager2/app/modules/person/domain/params/create_person_param.dart';

abstract class IPersonRepository {
  Future<PersonEntity> create(CreatePersonParam param);
  Future<List<PersonEntity>> getPersons();
}
