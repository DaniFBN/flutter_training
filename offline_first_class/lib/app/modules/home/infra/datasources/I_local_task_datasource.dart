import 'package:offline_first_class/app/modules/home/domain/entities/task_entity.dart';

abstract class ILocalTaskDatasource {
  Future<TaskEntity> create(Map<String, dynamic> data);
}
