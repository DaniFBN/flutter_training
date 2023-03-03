import 'package:flutter/material.dart';

class DefaultNavigationButton extends StatelessWidget {
  final Widget page;
  final String title;

  const DefaultNavigationButton({
    Key? key,
    required this.page,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(200, 36)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        child: Text(title),
      ),
    );
  }
}
