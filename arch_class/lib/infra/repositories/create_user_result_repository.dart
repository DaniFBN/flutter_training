import 'package:arch_class/domain/entities/user_entity.dart';
import 'package:arch_class/domain/helpers/params.dart';
import 'package:arch_class/domain/repositories/i_create_user_repository.dart';
import 'package:arch_class/infra/datasources/i_create_user_datasource.dart';
import 'package:arch_class/infra/mappers/user_mapper.dart';
import 'package:result_dart/result_dart.dart';

import '../../app_exception.dart';

class CreateUserResultRepositoryImpl implements ICreateUserResultRepository {
  final ICreateUserDatasource _datasource;

  const CreateUserResultRepositoryImpl(this._datasource);

  @override
  AsyncResult<UserEntity, AppException> createUser(
    CreateUserParam param,
  ) async {
    try {
      final map = UserMapper.createUserToMap(param);
      final userMap = await _datasource.createUser(map);

      final entity = UserMapper.fromMap(userMap);
      return Result.success(entity);
    } on AppException catch (e) {
      return Result.failure(e);
    }
  }
}


// Model{
//   propriedades    - Domain.Entity
//   toMap/fromMap   - Infra.Mapper
//   logic           - Domain.Usecase
// }
