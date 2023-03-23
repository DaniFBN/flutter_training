abstract class TodoBlocEvent {
  const TodoBlocEvent();
}

class GetAllTodoBlocEvent extends TodoBlocEvent {
  final String userID;

  const GetAllTodoBlocEvent(this.userID);
}
