import 'package:offline_first_class/app/modules/home/domain/entities/task_entity.dart';

class TaskMapper {
  TaskMapper._();

  static Map<String, dynamic> toMap(TaskEntity task) {
    return {
      'id': task.id,
      'name': task.name,
    };
  }

  static TaskEntity fromMap(Map<String, dynamic> data) {
    return TaskEntity(
      id: data['id'],
      name: data['name'],
    );
  }
}
