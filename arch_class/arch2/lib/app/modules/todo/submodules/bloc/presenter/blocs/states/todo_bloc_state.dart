import 'package:arch2/app/modules/todo/domain/entities/entities.dart';
import 'package:arch2/app/modules/todo/domain/failures/failures.dart';

abstract class TodoBlocState {
  const TodoBlocState();
}

class ErrorTodoBlocState extends TodoBlocState {
  final TodoFailure failure;

  const ErrorTodoBlocState(this.failure);
}

class LoadingTodoBlocState extends TodoBlocState {
  const LoadingTodoBlocState();
}

class DataTodoBlocState extends TodoBlocState {
  final Set<TodoEntity> todos;

  const DataTodoBlocState(this.todos);
}
