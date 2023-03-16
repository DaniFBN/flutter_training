import 'package:arch2/app/modules/todo/domain/entities/entities.dart';
import 'package:arch2/app/modules/todo/domain/failures/failures.dart';
import 'package:fpdart/fpdart.dart';

import '../../params/params.dart';

abstract class CreateTodoUsecase {
  Future<Either<TodoFailure, TodoEntity>> call(CreateTodoParam param);
}
