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
              onPressed: () => Modular.to.pushNamed('bloc/'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Bloc'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              onPressed: () => Modular.to.pushNamed('triple/'),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Triple'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('notifier/'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Notifier'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
