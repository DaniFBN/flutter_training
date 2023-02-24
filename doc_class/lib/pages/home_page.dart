import 'package:doc_class/pages/random_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doc Class')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _NavigationButton(
              page: RandomPage(),
              title: 'Random String',
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final Widget page;
  final String title;

  const _NavigationButton({
    Key? key,
    required this.page,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(fixedSize: const Size(200, 36)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Text(title),
    );
  }
}
