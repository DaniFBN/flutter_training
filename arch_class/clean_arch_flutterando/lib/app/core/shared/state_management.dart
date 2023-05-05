// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

typedef OnListenData<State extends Object> = void Function(State);

abstract class StateManagement<State extends Object> {
  StateManagement(this.state);

  final State state;

  void emit(State newState);
  StreamSubscription<State> listenWhen<FilteredType extends State>(
    OnListenData<State> onData,
  );
  void dispose();
}
