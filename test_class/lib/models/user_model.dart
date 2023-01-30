class UserModel {
  final String name;

  const UserModel(this.name);

  static List<UserModel> getUsersByName({
    required List<UserModel> users,
    required String name,
  }) {
    return users.where((user) => user.name == name).toList();
  }
}
