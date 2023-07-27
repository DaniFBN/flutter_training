import 'package:person_manager/app/modules/person/domain/entities/person_entity.dart';

import '../params/create_person_param.dart';
import '../responses/create_person_response.dart';

abstract interface class IPersonRepository {
  Future<CreatePersonResponse> create(CreatePersonParam param);
  Future<List<PersonEntity>> getPersons();
}
