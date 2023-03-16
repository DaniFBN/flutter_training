import 'package:arch2/app/modules/todo/domain/entities/entities.dart';
import 'package:arch2/app/modules/todo/domain/params/create_todo_param.dart';

class TodoModel extends TodoEntity {
  const TodoModel({
    required super.id,
    required super.name,
    required super.userID,
    required super.description,
    required super.createdAt,
    super.executedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'created_at': createdAt,
      'executed_at': executedAt,
    };
  }

  static Map<String, dynamic> entityToMap(TodoEntity todo) {
    return {
      'id': todo.id,
      'name': todo.name,
      'description': todo.description,
      'created_at': todo.createdAt,
      'executed_at': todo.executedAt,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> data) {
    return TodoModel(
      id: data['id'],
      userID: data['user_id'],
      name: data['name'],
      description: data['description'],
      createdAt: data['created_at'],
      executedAt: data['executed_at'],
    );
  }

  static Map<String, dynamic> createParamToMap(CreateTodoParam param) {
    return {
      'name': param.name,
      'description': param.description,
      'created_at': DateTime.now(),
    };
  }
}
