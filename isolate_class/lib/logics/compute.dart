import 'package:flutter/foundation.dart';

import '../fibonacci.dart';

Future<BigInt> isolateCompute(String value) async {
  final bigInt = BigInt.from(int.parse(value));
  
  final newValue = await compute(fibonacci, bigInt);

  return newValue;
}
