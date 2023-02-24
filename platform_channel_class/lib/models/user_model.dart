
class UserModel {
  final String name;

  const UserModel({
    required this.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
    );
  }

  @override
  String toString() => 'UserModel(name: $name)';
}
