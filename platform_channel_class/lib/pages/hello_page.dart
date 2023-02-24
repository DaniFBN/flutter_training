import 'dart:math';

import 'package:flutter/material.dart';
import 'package:platform_channel_class/platform_channel_handler.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String helloMessage = '';
  final platformHandler = const PlatformChannelHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello Page')),
      body: Center(child: Text(helloMessage)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final index = Random().nextInt(5000);
          final result = await platformHandler.getHelloMessage('Daniel $index');
          setState(() {
            helloMessage = result;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
