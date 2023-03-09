import 'package:fpdart/fpdart.dart';

import '../../entities/entities.dart';
import '../../failures/failures.dart';
import '../../params/params.dart';
import '../../repositories/repositories.dart';
import '../usecases.dart';

class CreateTodoUsecaseImpl implements CreateTodoUsecase {
  final ChangeTodoRepository _repository;

  const CreateTodoUsecaseImpl(this._repository);

  @override
  Future<Either<TodoFailure, TodoEntity>> call(CreateTodoParam param) async {
    if (param.name.isEmpty) {
      return Left(ValidationTodoFailure('O nome é obrigatório'));
    }
    if (param.description.isEmpty) {
      return Left(ValidationTodoFailure('A descrição é obrigatório'));
    }

    // final response = await _repository.create2(param);

    // final result = response.fold(id, id);
    // // response.fold((l) => l, (r) => r);
    // if (result is TodoFailure) return Left(result);

    // final todo = TodoEntity(
    //   id: result as String,
    //   name: param.name,
    //   description: param.description,
    //   createdAt: DateTime.now(),
    // );
    // return Right(todo);

    return _repository.create(param);
  }
}
