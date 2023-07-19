class CreateTodoParam {
  const CreateTodoParam({
    required this.userID,
    required this.name,
    required this.description,
  });

  final String userID;
  final String name;
  final String description;
}
