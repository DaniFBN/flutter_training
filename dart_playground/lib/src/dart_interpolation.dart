// ignore_for_file: prefer_interpolation_to_compose_strings

void dartInterpolation() {
  final name = 'Daniel';
  final age = 23.7;

  // print(name + age); Só é possível somar/juntar Strings
  print(name + age.toString());

  print('$name tem $age anos');
  print(name + ' tem ' + age.toString() + ' anos');
  print('Ele nasceu em ${2023 - age.floor()}');

  print('Ele nasceu em ${2023 - age.round()}');

  final user = UserModel('Daniel', 23);
  print('${user.name} tem ${user.age} anos');
}

class UserModel {
  final String name;
  final int age;

  UserModel(this.name, this.age);
}
