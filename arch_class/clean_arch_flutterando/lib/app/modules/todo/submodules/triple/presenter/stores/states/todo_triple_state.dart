import '../../../../../domain/entities/entities.dart';

class TodoTripleState {
  const TodoTripleState(this.todos);
  factory TodoTripleState.initState() {
    return const TodoTripleState({});
  }

  final Set<TodoEntity> todos;
}
