import 'package:offline_first_class/app/core/shared/services/local_storage/helpers/params.dart';
import 'package:offline_first_class/app/core/shared/services/local_storage/i_local_storage_service.dart';
import 'package:offline_first_class/app/modules/home/domain/entities/task_entity.dart';
import 'package:offline_first_class/app/modules/home/infra/datasources/I_local_task_datasource.dart';

import '../infra/mappers/task_mapper.dart';

class LocalTaskDatasource implements ILocalTaskDatasource {
  final ILocalStorageService _localStorageService;

  static const _localStorageKey = 'tasks';

  const LocalTaskDatasource(this._localStorageService);

  @override
  Future<TaskEntity> create(Map<String, dynamic> data) async {
    final param = SpreadLocalStorageParam(
      key: _localStorageKey,
      data: data,
    );
    final taskID = await _localStorageService.spread(param);

    return TaskMapper.fromMap({'id': taskID, ...data});
  }
}
