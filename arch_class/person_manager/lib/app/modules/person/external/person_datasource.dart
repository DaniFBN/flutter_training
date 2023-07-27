import 'package:person_manager/app/core/services/local_storage/helpers/params.dart';
import 'package:person_manager/app/modules/person/domain/responses/create_person_response.dart';
import 'package:person_manager/app/modules/person/infra/datasources/person_datasource.dart';

import '../../../core/services/local_storage/local_storage_service.dart';

class PersonDatasource implements IPersonDatasource {
  final ILocalStorageService _localStorageService;

  const PersonDatasource(this._localStorageService);

  static const _table = 'persons';

  @override
  Future<CreatePersonResponse> create(Map<String, dynamic> data) async {
    final param = WriteLocalStorageParam(_table, data);
    final result = await _localStorageService.write(param);

    final response = CreatePersonResponse(result.id);
    return response;
  }

  @override
  Future<List<Map<String, dynamic>>> getPersons() async {
    final data = await _localStorageService.read(_table);

    return data;
  }
}
