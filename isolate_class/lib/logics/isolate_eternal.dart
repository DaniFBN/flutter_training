import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import '../fibonacci.dart';

typedef IsolateCallback = void Function(Map<String, dynamic> data);

class FibonacciEternalIsolate {
  FibonacciEternalIsolate()
      : _streamController = StreamController.broadcast()..add(BigInt.zero),
        _output = ReceivePort();

  final ReceivePort _output;
  final StreamController<BigInt> _streamController;
  late final Isolate _isolate;
  late final StreamSubscription _executeSubscription;
  late final SendPort _sendPortToExecute;
  Stream<BigInt> get output => _streamController.stream;

  Future<void> init() async {
    final outputStream = _output.asBroadcastStream();

    _isolate = await Isolate.spawn(_isolateLogic, _output.sendPort);
    _sendPortToExecute = await outputStream.first;
    _executeSubscription = outputStream.listen((message) {
      if (message is BigInt) {
        _streamController.add(message);
      } else {
        log('${message.runtimeType} is not a BigInt');
      }
    });
  }

  Future<void> execute(BigInt value) async {
    _sendPortToExecute.send(value);
  }

  void dispose() {
    _streamController.close();
    _executeSubscription.cancel();
    _output.close();
    _isolate.kill(priority: Isolate.immediate);
  }
}

void _isolateLogic(SendPort externalSendPort) {
  final internalPort = ReceivePort();

  externalSendPort.send(internalPort.sendPort);

  internalPort.listen((bigInt) {
    final newValue = fibonacci(bigInt);
    externalSendPort.send(newValue);
  });
}
