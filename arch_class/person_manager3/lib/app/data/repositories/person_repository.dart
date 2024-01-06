import 'package:person_manager3/app/data/datasources/i_person_datasource.dart';
import 'package:person_manager3/app/domain/entities/person_entity.dart';
import 'package:person_manager3/app/domain/params/create_person_param.dart';
import 'package:person_manager3/app/domain/repositories/person_repository.dart';

import '../mappers/person_mapper.dart';

class PersonRepository implements IPersonRepository {
  final IPersonDatasource _datasource;

  const PersonRepository(this._datasource);

  @override
  Future<PersonEntity> create(CreatePersonParam param) async {
    try {
      final person = await _datasource.create(param);

      return person;
    } catch (e) {
      // Crashlytics
      rethrow;
    }
  }

  Future<PersonEntity> createMap(CreatePersonParam param) async {
    try {
      final datasourceParam = PersonMapper.createParamToMap(param);
      final data = await _datasource.createMap(datasourceParam);

      final person = PersonMapper.fromMap(data);

      return person;
    } catch (e) {
      // Crashlytics
      rethrow;
    }
  }
}
