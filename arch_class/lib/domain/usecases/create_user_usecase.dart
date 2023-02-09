import 'package:arch_class/domain/entities/user_entity.dart';

import '../helpers/params.dart';
import '../repositories/i_create_user_repository.dart';

// abstract class IParam {}

// abstract class IUsecase<Response, P extends IParam> {
//   Response call(P param);
// }

// abstract class ICreateUserUsecase
//     implements IUsecase<Future<UserEntity>, CreateUserParam> {}

abstract class ICreateUserUsecase {
  Future<UserEntity> call(CreateUserParam param);
}

class CreateUserUsecaseImpl implements ICreateUserUsecase {
  final ICreateUserRepository _repository;

  CreateUserUsecaseImpl(this._repository);

  @override
  Future<UserEntity> call(CreateUserParam param) async {
    // Validações
    final nameValidation = param.name.validate();
    if (nameValidation != null) throw nameValidation;

    return await _repository.createUser(param);
  }
}
