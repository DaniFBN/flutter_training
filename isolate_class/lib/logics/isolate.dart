import 'dart:isolate';

import '../fibonacci.dart';

Future<BigInt> isolatePort(String value) async {
  final bigInt = BigInt.from(int.parse(value));

  final result = await FibonacciIsolate.execute(bigInt);

  return result;
}

typedef IsolateCallback = void Function(Map<String, dynamic> data);

class FibonacciIsolate {
  const FibonacciIsolate._();

  static Future<BigInt> execute(BigInt value) async {
    final receivePort = ReceivePort();

    final isolate = await Isolate.spawn(_isolateLogic, {
      'sendPort': receivePort.sendPort,
      'data': value,
    });

    final result = await receivePort.first;

    receivePort.close();
    isolate.kill();

    return result;
  }

  static void _isolateLogic(Map<String, dynamic> data) {
    final SendPort externalPort = data['sendPort'];
    final BigInt bigInt = data['data'];

    final newValue = fibonacci(bigInt);
    externalPort.send(newValue);
  }
}

// ReceivePort(sendPort) -> Isolate(sendPort) -> sendPort(result)
