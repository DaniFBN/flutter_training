import '../../../../../domain/entities/entities.dart';
import '../../../../../domain/failures/failures.dart';

abstract class TodoBlocState {
  const TodoBlocState();
}

class ErrorTodoBlocState extends TodoBlocState {
  const ErrorTodoBlocState(this.failure);
  final TodoFailure failure;
}

class LoadingTodoBlocState extends TodoBlocState {
  const LoadingTodoBlocState();
}

class DataTodoBlocState extends TodoBlocState {
  const DataTodoBlocState(this.todos);
  final Set<TodoEntity> todos;
}
