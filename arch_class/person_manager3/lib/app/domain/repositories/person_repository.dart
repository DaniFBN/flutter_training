import 'package:person_manager3/app/domain/entities/person_entity.dart';
import 'package:person_manager3/app/domain/params/create_person_param.dart';

abstract interface class IPersonRepository {
  Future<PersonEntity> create(CreatePersonParam param);
}
