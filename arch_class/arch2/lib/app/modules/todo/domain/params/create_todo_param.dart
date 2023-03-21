class CreateTodoParam {
  final String userID;
  final String name;
  final String description;

  const CreateTodoParam({
    required this.userID,
    required this.name,
    required this.description,
  });
}
