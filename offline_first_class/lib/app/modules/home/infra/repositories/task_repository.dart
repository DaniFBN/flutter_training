import 'package:fpdart/fpdart.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/entities/sync_entity.dart';
import 'package:offline_first_class/app/core/offline_sync/domain/usecases/create_sync_usecase.dart';
import 'package:offline_first_class/app/core/shared/exceptions/i_app_exception.dart';
import 'package:offline_first_class/app/modules/home/domain/entities/task_entity.dart';
import 'package:offline_first_class/app/modules/home/domain/repositories/i_task_repository.dart';
import 'package:offline_first_class/app/modules/home/infra/datasources/I_local_task_datasource.dart';
import 'package:offline_first_class/app/modules/home/infra/mappers/task_mapper.dart';

class TaskRepository implements ITaskRepository {
  final ILocalTaskDatasource _localTaskDatasource;
  final ICreateSyncUsecase _createSyncUsecase;

  const TaskRepository(
    this._localTaskDatasource,
    this._createSyncUsecase,
  );

  @override
  Future<Either<IAppException, TaskEntity>> create(String name) async {
    try {
      final data = {'name': name};
      final entity = await _localTaskDatasource.create(data);

      _addSync(entity);

      return Right(entity);
    } on IAppException catch (e) {
      return Left(e);
    }
  }

  Future<void> _addSync(TaskEntity task) async {
    final sync = SyncEntity(
      itemID: task.id,
      data: TaskMapper.toMap(task),
      operation: SyncOperation.create,
      createdAt: DateTime.now(),
      table: 'tasks',
    );
    await _createSyncUsecase(sync);
  }
}
