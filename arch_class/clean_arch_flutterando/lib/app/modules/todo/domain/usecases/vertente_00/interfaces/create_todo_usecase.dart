import 'package:fpdart/fpdart.dart';

import '../../../entities/entities.dart';
import '../../../failures/failures.dart';
import '../../../params/params.dart';

abstract class CreateTodoUsecase {
  // Command
  Future<Either<TodoFailure, TodoEntity>> call(CreateTodoParam param);
}
