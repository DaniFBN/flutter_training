import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({
    Key? key,
    required this.leading,
    required this.title,
  }) : super(key: key);

  final Widget leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(title),
        leading: leading,
      ),
      drawer: const Drawer(),
      body: Center(
        child: TextButton(
          child: const Text('Back to Menu'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
