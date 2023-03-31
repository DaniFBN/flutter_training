import 'package:fpdart/fpdart.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';
import '../params/params.dart';

abstract class GetTodoRepository {
  ///Pegar todos os ToDos de todos os usuários
  void getAll();

  ///Pegar um ToDo pelo seu ID
  void getByID();

  /// Pegar todos os ToDos pelo ID do usuário
  Future<Either<TodoFailure, Set<TodoEntity>>> getAllByUserID(
    GetAllByUserIDParam param,
  );
}
