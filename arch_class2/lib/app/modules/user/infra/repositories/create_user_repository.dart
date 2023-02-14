import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/helpers/params.dart';
import '../../domain/repositories/i_create_user_repository.dart';
import '../datasources/i_create_user_datasource.dart';
import '../mappers/user_mapper.dart';

class CreateUserRepositoryImpl implements ICreateUserRepository {
  final ICreateUserDatasource _datasource;

  const CreateUserRepositoryImpl(this._datasource);

  @override
  Future<Either<AppException, UserEntity>> createUser(
    CreateUserParam param,
  ) async {
    try {
      final map = UserMapper.createUserToMap(param);
      final userMap = await _datasource.createUser(map);

      final entity = UserMapper.fromMap(userMap);
      return Right(entity);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}


// Model{
//   propriedades    - Domain.Entity
//   toMap/fromMap   - Infra.Mapper
//   logic           - Domain.Usecase
// }
