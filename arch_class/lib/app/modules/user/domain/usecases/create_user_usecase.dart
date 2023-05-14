import 'package:fpdart/fpdart.dart';

import '../entities/user_entity.dart';
import '../helpers/exceptions.dart';
import '../helpers/params.dart';
import '../repositories/i_create_user_repository.dart';

// abstract class IParam {}

// abstract class IFutureUsecase<Response, P> {
//   Future<Either<AppException, Response>> call(P param);
// }

// abstract class ICreateUserUsecase
//     implements IFutureUsecase<UserEntity, CreateUserParam> {}

abstract class ICreateUserUsecase {
  Future<Either<UserException, UserEntity>> call(CreateUserParam param);
}

class CreateUserUsecaseImpl implements ICreateUserUsecase {
  final ICreateUserRepository _repository;

  const CreateUserUsecaseImpl(this._repository);

  @override
  Future<Either<UserException, UserEntity>> call(CreateUserParam param) async {
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
