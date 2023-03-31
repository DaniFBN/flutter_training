import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/failures/failures.dart';

abstract class TodoNotifierState {
  const TodoNotifierState();
}

class ErrorTodoNotifierState extends TodoNotifierState {
  const ErrorTodoNotifierState(this.failure);
  final TodoFailure failure;
}

class LoadingTodoNotifierState extends TodoNotifierState {
  const LoadingTodoNotifierState();
}

class DataTodoNotifierState extends TodoNotifierState {
  const DataTodoNotifierState(this.todos);
  final Set<TodoEntity> todos;
}
