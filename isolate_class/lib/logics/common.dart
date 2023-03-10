import '../fibonacci.dart';

Future<BigInt> withoutIsolate(String value) async {
  final bigInt = BigInt.from(int.parse(value));

  final newValue = fibonacci(bigInt);

  return newValue;
}
