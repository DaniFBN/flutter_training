import '../../domain/entities/entities.dart';
import '../../domain/params/params.dart';

class TodoMapper {
  const TodoMapper._();

  static Map<String, dynamic> toMap(TodoEntity todo) {
    return {
      'id': todo.id,
      'name': todo.name,
      'description': todo.description,
      'created_at': todo.createdAt,
      'executed_at': todo.executedAt,
    };
  }

  static TodoEntity fromMap(Map<String, dynamic> data) {
    return TodoEntity(
      id: data['id'],
      userID: data['user_id'],
      name: data['name'],
      description: data['description'],
      createdAt: data['created_at'],
      executedAt: data['executed_at'],
    );
  }

  static Iterable<TodoEntity> fromListMap(List<Map<String, dynamic>> data) {
    return data.map(fromMap);
  }

  static Map<String, dynamic> createParamToMap(CreateTodoParam param) {
    return {
      'name': param.name,
      'description': param.description,
    };
  }
}
