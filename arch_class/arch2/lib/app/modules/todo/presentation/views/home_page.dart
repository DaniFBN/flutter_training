import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/triple/'),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Triple'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
