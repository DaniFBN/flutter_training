import 'package:arch_class/app_exception.dart';
import 'package:arch_class/domain/entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../helpers/exceptions.dart';
import '../helpers/params.dart';
import '../repositories/i_create_user_repository.dart';

// abstract class IParam {}

abstract class IFutureUsecase<Response, P> {
  Future<Either<AppException, Response>> call(P param);
}

abstract class ICreateUserUsecase
    implements IFutureUsecase<UserEntity, CreateUserParam> {}

// abstract class ICreateUserUsecase {
//   Future<UserEntity> call(CreateUserParam param);
// }

class CreateUserUsecaseImpl implements ICreateUserUsecase {
  final ICreateUserRepository _repository;

  CreateUserUsecaseImpl(this._repository);

  @override
  Future<Either<AppException, UserEntity>> call(CreateUserParam param) async {
    // Validações
    final nameValidation = param.name.validate();
    if (nameValidation != null) {
      return Left(
        ValidateException(
          nameValidation,
          stackTrace: StackTrace.current,
        ),
      );
    }

    return await _repository.createUser(param);
  }
}
