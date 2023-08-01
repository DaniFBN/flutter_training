import 'package:person_manager/app/core/failures/app_failure.dart';
import 'package:person_manager/app/modules/person/domain/entities/person_entity.dart';
import 'package:result_dart/result_dart.dart';

import '../params/create_person_param.dart';
import '../responses/create_person_response.dart';

abstract interface class IPersonRepository {
  AsyncResult<CreatePersonResponse, AppFailure> create(CreatePersonParam param);
  AsyncResult<List<PersonEntity>, AppFailure> getPersons();
}
