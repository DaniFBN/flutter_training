import 'package:arch2/app/modules/todo/domain/entities/entities.dart';
import 'package:arch2/app/modules/todo/domain/failures/failures.dart';

abstract class TodoNotifierState {
  const TodoNotifierState();
}

class ErrorTodoNotifierState extends TodoNotifierState {
  final TodoFailure failure;

  const ErrorTodoNotifierState(this.failure);
}

class LoadingTodoNotifierState extends TodoNotifierState {
  const LoadingTodoNotifierState();
}

class DataTodoNotifierState extends TodoNotifierState {
  final Set<TodoEntity> todos;

  const DataTodoNotifierState(this.todos);
}
