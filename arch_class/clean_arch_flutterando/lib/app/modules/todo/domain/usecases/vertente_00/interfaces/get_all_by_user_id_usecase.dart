import 'package:fpdart/fpdart.dart';

import '../../../entities/entities.dart';
import '../../../failures/failures.dart';
import '../../../params/get_all_by_user_id_param.dart';

// Command Pattern
abstract class GetAllByUserIDUsecase {
  Future<Either<TodoFailure, Set<TodoEntity>>> call(GetAllByUserIDParam param);
}
