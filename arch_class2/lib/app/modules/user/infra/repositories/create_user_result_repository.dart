import 'package:result_dart/result_dart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/helpers/params.dart';
import '../../domain/repositories/i_create_user_repository.dart';
import '../datasources/i_create_user_datasource.dart';
import '../mappers/user_mapper.dart';

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
