import 'package:flutter/material.dart';
import 'package:platform_channel_class/platform_channel_handler.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  String batteryLevel = '';
  final platformHandler = const PlatformChannelHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Battery Page')),
      body: Center(child: Text(batteryLevel)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await platformHandler.getBatteryLevel();
          setState(() {
            batteryLevel = '$result%';
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
