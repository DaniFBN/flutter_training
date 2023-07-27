import 'package:person_manager/app/core/failures/app_failure.dart';
import 'package:person_manager/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager/app/modules/person/domain/params/create_person_param.dart';
import 'package:person_manager/app/modules/person/domain/repositories/person_repository.dart';
import 'package:person_manager/app/modules/person/domain/responses/create_person_response.dart';
import 'package:person_manager/app/modules/person/infra/mappers/person_mapper.dart';

import '../datasources/person_datasource.dart';

class PersonRepository implements IPersonRepository {
  final IPersonDatasource _datasource;

  const PersonRepository(this._datasource);

  @override
  Future<CreatePersonResponse> create(CreatePersonParam param) async {
    try {
      final data = PersonMapper.createParamToMap(param);
      final result = await _datasource.create(data);

      return result;
    } on AppFailure {
      rethrow;
    }
  }

  @override
  Future<List<PersonEntity>> getPersons() async {
    try {
      final result = await _datasource.getPersons();

      final entities = PersonMapper.fromListMap(result);
      return entities;
    } on AppFailure {
      rethrow;
    }
  }
}
