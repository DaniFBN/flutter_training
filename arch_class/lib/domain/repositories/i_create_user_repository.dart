import 'package:arch_class/app_exception.dart';
import 'package:arch_class/domain/entities/user_entity.dart';
import 'package:arch_class/domain/helpers/params.dart';
import 'package:fpdart/fpdart.dart';
import 'package:result_dart/result_dart.dart';

abstract class ICreateUserRepository {
  Future<Either<AppException, UserEntity>> createUser(CreateUserParam param);
}

abstract class ICreateUserResultRepository {
  AsyncResult<UserEntity, AppException> createUser(CreateUserParam param);
}
