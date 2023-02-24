import 'package:flutter/material.dart';
import 'package:platform_channel_class/platform_channel_handler.dart';

import '../models/user_model.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({super.key});

  @override
  State<JsonPage> createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  List<UserModel> users = [];
  final platformHandler = const PlatformChannelHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Json Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: users.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final user = users.elementAt(index);
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(user.name),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await platformHandler.getJson();
          setState(() {
            users = result;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
