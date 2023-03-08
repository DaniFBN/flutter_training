import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;
  BigInt value = BigInt.from(0);

  Future<void> withoutIsolate() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    log('PRÉ FIBONACCI');
    final newValue = _fibonacci(BigInt.from(16));
    log('PÓS FIBONACCI');

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      loading = false;
      value = newValue;
    });
  }

  Future<void> isolateCompute() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    log('PRÉ FIBONACCI');
    final newValue = await compute(_fibonacci, BigInt.from(32));
    log('PÓS FIBONACCI');

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      loading = false;
      value = newValue;
    });
  }

  Future<void> isolatePort() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    log('PRÉ FIBONACCI');

    final receivePort = ReceivePort();
    final port = ReceivePort();

    final SendPort portToSendData = await port.first;

    final isolate = await Isolate.spawn(isolateLogic, receivePort.sendPort);

    portToSendData.send(BigInt.from(32));
    final newValue = await receivePort.first;
    isolate.kill();

    log('PÓS FIBONACCI');

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      value = newValue;
    });
  }

  void isolateLogic(SendPort port) {
    final privatePort = ReceivePort();
    port.send(privatePort.sendPort);

    privatePort.listen((message) {
      _fibonacci(message);
    });
    final newValue = _fibonacci(BigInt.from(32));

    port.send(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: withoutIsolate,
              child: const Text('Without Isolate'),
            ),
            ElevatedButton(
              onPressed: isolateCompute,
              child: const Text('Isolate - Compute'),
            ),
            ElevatedButton(
              onPressed: isolatePort,
              child: const Text('Isolate - Send/Receive Port'),
            ),
            if (loading) ...{
              const Center(child: CircularProgressIndicator()),
            } else ...{
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Value: $value'),
              ),
            }
          ],
        ),
      ),
    );
  }
}

BigInt _fibonacci(BigInt n) {
  if (n <= BigInt.from(2)) return BigInt.one;
  return _fibonacci(n - BigInt.one) + _fibonacci(n - BigInt.two);
}
