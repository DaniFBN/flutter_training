import 'dart:math';

import 'package:arch_class2/app/core/shared/services/local_storage/i_local_storage_service.dart';

import '../infra/datasources/i_create_user_datasource.dart';

class CreateUserDatasourceImpl implements ICreateUserDatasource {
  final ILocalStorageService _localStorageService;

  const CreateUserDatasourceImpl({
    required ILocalStorageService localStorageService,
  }) : _localStorageService = localStorageService;

  @override
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> map) async {
    map['address']['id'] = Random().nextInt(5000).toString();
    final mapWithID = {
      ...map,
      'id': Random().nextInt(5000).toString(),
    };

    await _localStorageService.write(key: 'user', data: mapWithID);

    return mapWithID;
  }
}
