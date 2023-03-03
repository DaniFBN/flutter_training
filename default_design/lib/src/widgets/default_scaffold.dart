import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.title,
    required this.body,
    this.action,
    this.fab,
  });

  final String title;
  final Widget body;
  final Widget? action;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (action != null) action!,
        ],
      ),
      body: Center(child: body),
      floatingActionButton: fab,
    );
  }
}
