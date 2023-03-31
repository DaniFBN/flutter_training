abstract class TodoBlocEvent {
  const TodoBlocEvent();
}

class GetAllTodoBlocEvent extends TodoBlocEvent {
  const GetAllTodoBlocEvent(this.userID);
  final String userID;
}
