import 'package:flutter/material.dart';
import 'package:platform_channel_class/platform_channel_handler.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Map<String, int> map = {};
  final platformHandler = const PlatformChannelHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map Page')),
      body: Center(child: Text(map.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await platformHandler.getMap();
          setState(() {
            map = result;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
