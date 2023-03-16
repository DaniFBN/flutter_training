import 'package:arch2/app/modules/todo/domain/entities/entities.dart';
import 'package:arch2/app/modules/todo/domain/params/create_todo_param.dart';

abstract class ChangeTodoDatasource {
  Future<TodoEntity> createTodo(CreateTodoParam param);
  Future<TodoEntity> update(TodoEntity todo);
}
