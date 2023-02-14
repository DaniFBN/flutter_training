import 'package:arch_class2/app/core/shared/services/local_storage/i_local_storage_service.dart';

import '../infra/datasources/i_get_users_datasource.dart';

class GetUsersDatasourceImpl implements IGetUsersDatasource {
  final ILocalStorageService _localStorageService;

  const GetUsersDatasourceImpl({
    required ILocalStorageService localStorageService,
  }) : _localStorageService = localStorageService;

  @override
  Future<List<Map<String, dynamic>>> getUsers() async {
    final data = await _localStorageService.read(key: 'user');

    return data;
  }
}
