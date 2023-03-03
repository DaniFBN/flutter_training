import 'package:fpdart/fpdart.dart';
import 'package:offline_first_class/app/core/shared/exceptions/i_app_exception.dart';
import 'package:offline_first_class/app/modules/home/domain/entities/task_entity.dart';
import 'package:offline_first_class/app/modules/home/domain/repositories/i_task_repository.dart';

abstract class ICreateTaskUsecase {
  Future<Either<IAppException, TaskEntity>> call(String name);
}

class CreateTaskUsecase implements ICreateTaskUsecase {
  final ITaskRepository _repository;

  const CreateTaskUsecase(this._repository);

  @override
  Future<Either<IAppException, TaskEntity>> call(String name) {
    return _repository.create(name);
  }
}
