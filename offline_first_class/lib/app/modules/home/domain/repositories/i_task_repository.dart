import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';
import '../entities/task_entity.dart';

abstract class ITaskRepository {
  Future<Either<IAppException, TaskEntity>> create(String name);
}
