import 'package:person_manager4/domain/entities/person_entity.dart';

import '../params/create_person_param.dart';

abstract class IPersonRepository {
  Future<PersonEntity> create(CreatePersonParam param);
}
