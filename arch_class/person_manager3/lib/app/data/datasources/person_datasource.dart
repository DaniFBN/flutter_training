import 'package:person_manager3/app/data/datasources/i_person_datasource.dart';
import 'package:person_manager3/app/data/mappers/person_mapper.dart';
import 'package:person_manager3/app/domain/entities/person_entity.dart';
import 'package:person_manager3/app/domain/params/create_person_param.dart';

import '../../core/services/i_local_storage.dart';

class PersonDatasource implements IPersonDatasource {
  final ILocalStorage _localStorage;

  const PersonDatasource(this._localStorage);

  @override
  Future<PersonEntity> create(CreatePersonParam param) async {
    final localStorageParam = PersonMapper.createParamToMap(param);
    final data = await _localStorage.add('persons', localStorageParam);

    final person = PersonMapper.fromMap(data);

    return person;
  }

  @override
  Future<Map<String, dynamic>> createMap(Map<String, dynamic> data) async {
    return await _localStorage.add('persons', data);
  }
}
