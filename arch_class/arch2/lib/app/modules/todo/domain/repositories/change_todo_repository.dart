import 'package:fpdart/fpdart.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';
import '../params/params.dart';

abstract class ChangeTodoRepository {
  /// Criar um ToDo
  Future<Either<TodoFailure, TodoEntity>> create(CreateTodoParam param);
  Future<Either<TodoFailure, String>> create2(CreateTodoParam param);

  /// Atualizar um ToDo
  void update();

  /// Apagar um ToDo
  void delete();
}
