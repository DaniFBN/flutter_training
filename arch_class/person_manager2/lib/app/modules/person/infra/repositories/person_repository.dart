import 'package:person_manager2/app/core/exceptions/app_exception.dart';
import 'package:person_manager2/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager2/app/modules/person/domain/params/create_person_param.dart';
import 'package:person_manager2/app/modules/person/domain/repositories/person_repository.dart';

import '../datasources/person_datasource.dart';
import '../mappers/person_mapper.dart';

final class PersonRepository implements IPersonRepository {
  final IPersonDatasource _datasource;

  const PersonRepository(this._datasource);

  @override
  Future<PersonEntity> create(CreatePersonParam param) async {
    try {
      final data = PersonMapper.createParamToMap(param);
      final result = await _datasource.create(data);

      final entity = PersonMapper.fromMap(result);

      return entity;
    } on AppException {
      rethrow;
    }
  }

  @override
  Future<List<PersonEntity>> getPersons() async {
    try {
      final result = await _datasource.getPersons();

      final entities = PersonMapper.fromListMap(result).toList();

      return entities;
    } on AppException {
      rethrow;
    }
  }
}
