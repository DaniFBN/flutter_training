// ignore_for_file: public_member_api_docs, sort_constructors_first
void dartNullSafety() {
  int nullSafety1 = 0;
  // nullSafety1 = null; Erro

  int? nullSafety2 = 0;
  nullSafety2 = null;

  int nullSafety3;
  // print(nullSafety3); Erro

  final user1 = UserModel(name: 'Daniel');
  final age = user1.age ?? 0; // > 0
  print(age + 30); // > 30
  print(user1.age?.isEven); // null

  final user2 = UserModel(name: 'Daniel', age: 23, city: 'SP');
  print(user2.age! + 30);
  print(user2.age?.isEven);
  print(user2.whatever());

  String? data;
  final String handledData = guard<String>(data, '');

  final user3 = UserModel(name: 'Daniel', city: 'SP');
  print(user3.age! + 30); // Null check operator

  //   UserModel user3; // NOT_NULL
  UserModel? user4; // NULL=TRUE
  print(user4?.whatever());
}

MyType guard<MyType>(MyType? value, MyType defaultValue) {
  if (value == null) return defaultValue;
  return value;
}

class UserModel {
  final String name;
  final int? age;
  final String? city;

  UserModel({
    required this.name,
    this.age,
    this.city,
  });

  String whatever() {
    return 'rodo';
  }
}
