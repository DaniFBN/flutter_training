// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart_null_safety.dart';

void dartOperators() {
  print(1 + 1);
  print(1 - 1);
  print(1 * 1);
  print(1 % 1);
  print(1 / 1);

  print(1 == 1);

  print(1 != 1);
  print(1 > 1);
  print(1 >= 1);
  print(1 < 1);
  print(1 <= 1);

  print(1 == 1 && 2 > 1);
  print(1 == 1 || 2 > 1);
  print(!(1 == 1));

  var value = 0;
  value++;
  value--;
  value += 1; // value = value + 1;
  value -= 1; // value = value - 1;
  // value /= 1; // value = value ~/ 1;
  value ~/= 1; // value = value ~/ 1;
  // value = (8 / 3).round();
  value *= 1; // value = value * 1;
  value %= 1; // value = value % 1;

  print('' is String);
  print('' is! String);

  final dynamic asVar = 3;
  (asVar as int).isOdd;

  print(null ?? 23);
  final user = UserModel(name: 'Daniel');
  print(user.age);
  print(user.age ?? 72);

  value ??= 23;

  final ternarioVar = (asVar == 3 ? 47 : 52);

  // Cascade Operator (..) - Bastante usado em ClipPath
  var cascadeOperator = Cascade()
    ..method1()
    ..method2()
    ..method3();

  cascadeOperator.method1();

  final cascadeRepository = Repository();
  cascadeRepository.getProducts();
  cascadeRepository.getUsers();

  // final cascadeRepository = Repository()
  //   ..getProducts()
  //   ..getUsers();

  print(cascadeRepository.users);
  print(cascadeRepository.products);

  // Com ou sem, o resultado é igual

  // Com cascade
  // var cascadeOperator = Cascade()..method1();

  // Sem cascade
  // var cascadeOperator = Cascade();
  // cascadeOperator.method1();

  // Spread Operator (...)
  final spreadOperator = [
    ...[1, 2],
    ...{3, 4},
  ];

  spreadOperator.addAll([1, 2]);
  spreadOperator.addAll([3, 4]);

  final spreadOperator2 = {'name': 'Daniel', 'age': 23};
  final spreadOperator3 = {...spreadOperator2, 'id': 1};
}

class Cascade {
  int method1() {
    print('method1');

    return 1;
  }

  void method2() {
    print('method2');
  }

  int method3() {
    print('method3');

    return 32;
  }
}

class Repository {
  final List users = [];
  final List products = [];

  Future<void> getUsers() async {
    await Future.delayed(Duration(seconds: 1));

    users.addAll(['Daniel', 'Tauã', 'Amanda']);
  }

  Future<void> getProducts() async {
    await Future.delayed(Duration(seconds: 1));

    products.addAll(['Notebook', 'PS5', 'Teclado']);
  }
}
