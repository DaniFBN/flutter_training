import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isolate_class/logics/compute.dart';
import 'package:isolate_class/logics/isolate.dart';

import 'logics/common.dart';
import 'logics/isolate_eternal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController(text: '10');
  final isolate = FibonacciEternalIsolate();
  late final StreamSubscription subscription;
  bool loading = false;
  BigInt value = BigInt.from(0);

  @override
  void initState() {
    super.initState();

    subscription = isolate.output.listen((event) {
      setState(() {
        loading = false;
        value = event;
      });
    });
  }

  Future<void> calc(
    Future<BigInt> Function(String value) calculateFibonacci,
  ) async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    log('PRÉ FIBONACCI');

    final result = await calculateFibonacci(controller.text);

    log('PÓS FIBONACCI');
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      loading = false;

      value = result;
    });
  }

  void isolateEternalPort() {
    isolate.execute(BigInt.from(int.parse(controller.text)));
  }

  @override
  void dispose() {
    subscription.cancel();
    isolate.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolate Class'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: FutureBuilder(
            future: isolate.init(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => calc(withoutIsolate),
                      child: const Text('Without Isolate'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => calc(isolateCompute),
                      child: const Text('Isolate - Compute'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => calc(isolatePort),
                      child: const Text('Isolate - Send/Receive Port'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: isolateEternalPort,
                      child: const Text('Isolate Eternal'),
                    ),
                  ),
                  if (loading) ...{
                    const Center(child: CircularProgressIndicator()),
                  } else ...{
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Value: $value'),
                    ),
                  },
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
