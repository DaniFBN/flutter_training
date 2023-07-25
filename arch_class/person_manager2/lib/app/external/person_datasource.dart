import 'package:person_manager2/app/infra/datasources/person_datasource.dart';

import '../core/services/local_storage/helpers/params.dart';
import '../core/services/local_storage/i_local_storage_service.dart';

class PersonDatasource implements IPersonDatasource {
  final ILocalStorageService _localStorageService;

  const PersonDatasource(this._localStorageService);

  static const _table = 'persons';

  @override
  Future<Map<String, dynamic>> create(Map<String, dynamic> data) async {
    final param = WriteLocalStorageParam(data: data, table: _table);
    final result = await _localStorageService.write(param);
    return result;
  }
}
