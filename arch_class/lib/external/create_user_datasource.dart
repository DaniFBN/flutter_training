import 'dart:math';

import 'package:arch_class/infra/datasources/i_create_user_datasource.dart';

class CreateUserDatasourceImpl implements ICreateUserDatasource {
  @override
  Future<Map<String, dynamic>> createUser(Map<String, dynamic> map) async {
    final mapWithID = {
      ...map,
      'id': Random().nextInt(5000).toString(),
    };

    await Future.delayed(const Duration(seconds: 2));

    return mapWithID;
  }
}
