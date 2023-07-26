import 'package:person_manager2/app/core/exceptions/app_exception.dart';
import 'package:person_manager2/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager2/app/modules/person/domain/params/create_person_param.dart';
import 'package:result_dart/result_dart.dart';

abstract class IPersonRepository {
  AsyncResult<PersonEntity, AppException> create(CreatePersonParam param);
  AsyncResult<List<PersonEntity>, AppException> getPersons();
}
