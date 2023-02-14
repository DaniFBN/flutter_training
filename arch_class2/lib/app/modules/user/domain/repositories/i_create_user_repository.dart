
import 'package:fpdart/fpdart.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../entities/user_entity.dart';
import '../helpers/params.dart';

abstract class ICreateUserRepository {
  Future<Either<AppException, UserEntity>> createUser(CreateUserParam param);
}

abstract class ICreateUserResultRepository {
  AsyncResult<UserEntity, AppException> createUser(CreateUserParam param);
}
