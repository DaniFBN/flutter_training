import 'package:person_manager/app/core/failures/app_failure.dart';
import 'package:person_manager/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager/app/modules/person/domain/params/create_person_param.dart';
import 'package:person_manager/app/modules/person/domain/repositories/person_repository.dart';
import 'package:person_manager/app/modules/person/domain/responses/create_person_response.dart';
import 'package:person_manager/app/modules/person/infra/mappers/person_mapper.dart';
import 'package:result_dart/result_dart.dart';

import '../datasources/person_datasource.dart';

class PersonRepository implements IPersonRepository {
  final IPersonDatasource _datasource;

  const PersonRepository(this._datasource);

  @override
  AsyncResult<CreatePersonResponse, AppFailure> create(
    CreatePersonParam param,
  ) async {
    try {
      final data = PersonMapper.createParamToMap(param);
      final result = await _datasource.create(data);

      return Result.success(result);
    } on AppFailure catch (e) {
      return Result.failure(e);
    } catch (e) {
      return Result.failure(GenericFailure('Erro na API'));
    }
  }

  @override
  AsyncResult<List<PersonEntity>, AppFailure> getPersons() async {
    try {
      final result = await _datasource.getPersons();

      final entities = PersonMapper.fromListMap(result);
      return entities.toSuccess();
    } on AppFailure catch (e) {
      return Result.failure(e);
    }
  }
}

class GenericFailure extends AppFailure {
  GenericFailure(super.message, {super.stackTrace});
}
