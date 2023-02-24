import 'package:arch_class2/app/core/interfaces/usecase_interfaces.dart';
import 'package:arch_class2/app/core/shared/exceptions/app_exception.dart';
import 'package:arch_class2/app/modules/user/domain/repositories/i_get_users_repository.dart';
import 'package:result_dart/result_dart.dart';

import '../entities/user_entity.dart';

abstract class IGetUsersUsecase
    implements IAsyncResultUsecase<List<UserEntity>, NoParams> {}

class GetUsersUsecaseImpl implements IGetUsersUsecase {
  final IGetUsersRepository _repository;

  GetUsersUsecaseImpl(this._repository);

  @override
  AsyncResult<List<UserEntity>, AppException> call(NoParams param) {
    return _repository.getUsers();
  }
}
