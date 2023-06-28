import 'dart:async';

import 'package:flutter/material.dart';
import 'package:platform_channel_class/platform_channel_handler.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final platformHandler = const PlatformChannelHandler();
  late final Stream<int> randomNumberStream;
  late final StreamSubscription subscription;

  int value = 0;

  @override
  void initState() {
    super.initState();

    randomNumberStream = platformHandler.getRandomNumbers();

    // subscription = platformHandler.getRandomNumbers().listen((event) {
    //   setState(() {
    //     value = event;
    //   });
    // });
  }

  @override
  void dispose() {
    // subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Page')),
      body: Center(
        child: Column(
          children: [
            // Text(
            //   value.toString(),
            //   style: const TextStyle(fontSize: 36),
            // ),
            StreamBuilder<int>(
              stream: randomNumberStream,
              builder: (_, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  style: const TextStyle(fontSize: 36),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
