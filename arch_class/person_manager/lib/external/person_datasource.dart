import 'package:person_manager/core/services/local_storage/helpers/params.dart';
import 'package:person_manager/domain/responses/create_person_response.dart';
import 'package:person_manager/infra/datasources/person_datasource.dart';

import '../core/services/local_storage/local_storage_service.dart';

class PersonDatasource implements IPersonDatasource {
  final ILocalStorageService _localStorageService;

  const PersonDatasource(this._localStorageService);

  @override
  Future<CreatePersonResponse> create(Map<String, dynamic> data) async {
    final param = WriteLocalStorageParam('persons', data);
    final result = await _localStorageService.write(param);

    final response = CreatePersonResponse(result.id);
    return response;
  }
}
