import 'package:arch2/app/modules/todo/domain/entities/entities.dart';
import 'package:arch2/app/modules/todo/domain/failures/failures.dart';
import 'package:fpdart/fpdart.dart';

import '../params/params.dart';

abstract class GetTodoRepository {
  /// Pegar todos os ToDos de todos os usuários
  void getAll();

  /// Pegar um ToDo pelo seu ID
  void getByID();

  /// Pegar todos os ToDos pelo ID do usuário
  Future<Either<TodoFailure, Set<TodoEntity>>> getAllByUserID(
    GetAllByUserIDParam param,
  );
}
