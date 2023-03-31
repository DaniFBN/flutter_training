import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/failures/failures.dart';

abstract class TodoCubitState {
  const TodoCubitState();
}

class ErrorTodoCubitState extends TodoCubitState {
  const ErrorTodoCubitState(this.failure);
  final TodoFailure failure;
}

class LoadingTodoCubitState extends TodoCubitState {
  const LoadingTodoCubitState();
}

class DataTodoCubitState extends TodoCubitState {
  const DataTodoCubitState(this.todos);
  final Set<TodoEntity> todos;
}
