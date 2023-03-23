import '../../../../domain/entities/entities.dart';

class TodoTripleState {
  final Set<TodoEntity> todos;

  const TodoTripleState(this.todos);

  factory TodoTripleState.initState() {
    return const TodoTripleState({});
  }
}
