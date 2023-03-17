import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../repositories/i_get_user_by_id_repository.dart';



abstract class IGetUserByIdUsecase {
  Future<Either<AppException, void>> call();
}

class GetUserByIdUsecase implements IGetUserByIdUsecase {
  const GetUserByIdUsecase(this._repository);

  final IGetUserByIdRepository _repository;

  @override
  Future<Either<AppException, void>>call() async {
    return _repository.getUserById();
  }
}
