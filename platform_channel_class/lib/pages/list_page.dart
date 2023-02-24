import 'package:flutter/material.dart';
import 'package:platform_channel_class/platform_channel_handler.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> list = [];
  final platformHandler = const PlatformChannelHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Page')),
      body: Center(child: Text(list.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result1 = await platformHandler.getList1();
          final result2 = await platformHandler.getList2();
          setState(() {
            list = [...result1, ...result2];
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
