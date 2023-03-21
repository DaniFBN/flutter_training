import '../../domain/entities/entities.dart';
import '../../domain/params/params.dart';

class TodoMapper {
  const TodoMapper._();

  static Map<String, dynamic> toMap(TodoEntity todo) {
    return {
      'id': todo.id,
      'name': todo.name,
      'user_id': todo.userID,
      'description': todo.description,
      'created_at': todo.createdAt.millisecondsSinceEpoch,
      'executed_at': todo.executedAt?.millisecondsSinceEpoch,
    };
  }

  static TodoEntity fromMap(Map<String, dynamic> data) {
    return TodoEntity(
      id: data['id'],
      userID: data['user_id'],
      name: data['name'],
      description: data['description'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      executedAt: data['executed_at'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(data['executed_at']),
    );
  }

  static Iterable<TodoEntity> fromListMap(List<Map<String, dynamic>> data) {
    return data.map(fromMap);
  }

  static Map<String, dynamic> createParamToMap(CreateTodoParam param) {
    return {
      'name': param.name,
      'description': param.description,
      'user_id': param.userID,
      'created_at': DateTime.now().millisecondsSinceEpoch,
    };
  }
}
