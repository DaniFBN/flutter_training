import 'package:fpdart/fpdart.dart';

import '../../entities/entities.dart';
import '../../failures/failures.dart';
import '../../params/params.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class GetAllByUserIDUsecaseImpl implements GetAllByUserIDUsecase {
  final GetTodoRepository _repository;

  const GetAllByUserIDUsecaseImpl(this._repository);

  @override
  Future<Either<TodoFailure, Set<TodoEntity>>> call(
    GetAllByUserIDParam param,
  ) async {
    if (param.userID.isEmpty) {
      return Left(ValidationTodoFailure('O ID não pode ser vazio'));
    }

    return _repository.getAllByUserID(param);
  }
}
