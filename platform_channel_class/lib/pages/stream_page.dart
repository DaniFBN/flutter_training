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

  @override
  void initState() {
    super.initState();

    randomNumberStream = platformHandler.getRandomNumbers();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Page')),
      body: Center(
        child: StreamBuilder<int>(
          stream: randomNumberStream,
          builder: (_, snapshot) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 36),
            );
          },
        ),
      ),
    );
  }
}
