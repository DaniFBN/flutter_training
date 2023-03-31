import '../../domain/entities/entities.dart';
import '../../domain/params/create_todo_param.dart';

abstract class ChangeTodoDatasource {
  Future<TodoEntity> createTodo(CreateTodoParam param);
  Future<TodoEntity> update(TodoEntity todo);
}
