// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:collection';

void dartTypes() {
  Object objVar;

  String stringVar;

  num numVar1 = 2;
  num numVar2 = 2.6;
  int intVar = 2;
  double doubleVar = 2.3;
  BigInt bigIntVar = BigInt.from(32);
  // Decimal e; https://pub.dev/packages/decimal

  bool f;

  Iterable iterableVar;
  List listVar = [1, 2, 3, 4, '', true];
  List<int> listVar1 = [1, 2, 3, 4];
  Set<int> setVar = {1, 2, 3, 4};

  Map<String, dynamic> mapVar = {'name': 'Daniel Fernandes'};

  dynamic dynamicVar;
  dynamicVar = 32;
  dynamicVar = true;
  dynamicVar = '';

  UnmodifiableListView ummodifiableListVar = UnmodifiableListView(listVar);

  OrderStatus enumVar2 = OrderStatus.delivered;
  final enumVar3 = OrderStatus.whateverStatic();
  final enumCancelledVar = OrderStatus.fromCode(3);
  final enumVar4 = OrderStatus.delivered.whatever();

  int Function(String) functionVar1 = function; // tear-off
  final response = functionVar1('');
  print(response.isEven);

  final (name1, age1) = recordFunction();
  final userData = recordFunction();
  final name2 = userData.$1;
  final age2 = userData.$2;
}

(String, int) recordFunction(){
  return ('Daniel', 23);
}

int function(String whatever) {
  return 0;
}

enum OrderStatus {
  delivered(7),
  cancelled(3);

  const OrderStatus(this.code);

  final int code;

  static OrderStatus fromCode(int code) {
    return values.firstWhere((e) => e.code == code);
  }

  void whatever() {}
  static void whateverStatic() {}
}

