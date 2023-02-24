import 'package:result_dart/result_dart.dart';

import '../../../../core/interfaces/usecase_interfaces.dart';
import '../../../../core/shared/exceptions/app_exception.dart';
import '../entities/user_entity.dart';
import '../helpers/exceptions.dart';
import '../helpers/params.dart';
import '../repositories/i_create_user_repository.dart';

abstract class ICreateUserResultUsecase
    implements IAsyncResultUsecase<UserEntity, CreateUserParam> {}

// abstract class ICreateUserUsecase {
//   Future<UserEntity> call(CreateUserParam param);
// }

class CreateUserResultUsecaseImpl implements ICreateUserResultUsecase {
  final ICreateUserResultRepository _repository;

  CreateUserResultUsecaseImpl(this._repository);

  @override
  AsyncResult<UserEntity, AppException> call(CreateUserParam param) async {
    // Validações
    final nameValidation = param.name.validate();
    if (nameValidation != null) {
      final exception = ValidateException(
        nameValidation,
        stackTrace: StackTrace.current,
      );
      return Result.failure(exception);
    }

    return await _repository.createUser(param);
  }
}
