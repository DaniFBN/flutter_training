// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileScaffold extends StatelessWidget {
  final Widget body;
  const MobileScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stylizing Platform Class'),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '1'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '2'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '3'),
          // BottomNavigationBarItem(icon: Icon(Icons.add), label: '4'),
        ],
      ),
    );
  }
}

class WebScaffold extends StatefulWidget {
  final Widget body;

  const WebScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  State<WebScaffold> createState() => _WebScaffoldState();
}

class _WebScaffoldState extends State<WebScaffold> {
  bool showLabel = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth > 1200) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    showLabel = !showLabel;
                  });
                },
              ),
              elevation: 0,
              title: const Text('Stylizing Platform Class'),
            ),
            body: Row(
              children: [
                Container(
                  width: showLabel ? size.height * 0.3 : size.height * 0.1,
                  height: constraints.maxHeight,
                  color: Colors.blue,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.add),
                        title: showLabel ? const Text('Item 1') : null,
                      )
                    ],
                  ),
                ),
                Expanded(child: widget.body),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Stylizing Platform Class'),
          ),
          drawer: const Drawer(),
          body: widget.body,
        );
      },
    );
  }
}

class IosScaffold extends StatelessWidget {
  final Widget body;

  const IosScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Stylizing Platform Class'),
      ),
      child: body,
    );
  }
}

class AppIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const AppIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(onPressed: onPressed, child: Icon(icon));
    }

    return IconButton(icon: Icon(icon), onPressed: onPressed);
  }
}

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) return MobileScaffold(body: body);
    if (Platform.isIOS) return IosScaffold(body: body);
    return WebScaffold(body: body);
  }
}
