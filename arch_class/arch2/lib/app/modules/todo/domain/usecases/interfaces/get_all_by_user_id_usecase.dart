import 'package:arch2/app/modules/todo/domain/entities/entities.dart';
import 'package:arch2/app/modules/todo/domain/failures/failures.dart';
import 'package:fpdart/fpdart.dart';

import '../../params/get_all_by_user_id_param.dart';

// Command Pattern
abstract class GetAllByUserIDUsecase {
  Future<Either<TodoFailure, Set<TodoEntity>>> call(GetAllByUserIDParam param);
}
