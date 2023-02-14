import 'package:result_dart/result_dart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_get_users_repository.dart';
import '../datasources/i_get_users_datasource.dart';
import '../mappers/user_mapper.dart';

class GetUsersRepositoryImpl implements IGetUsersRepository {
  final IGetUsersDatasource _datasource;

  const GetUsersRepositoryImpl(this._datasource);

  @override
  AsyncResult<List<UserEntity>, AppException> getUsers() async {
    try {
      final users = await _datasource.getUsers();
      final entities = UserMapper.fromListMap(users).toList();

      return Result.success(entities);
    } on AppException catch (e) {
      return Result.failure(e);
    }
  }
}
