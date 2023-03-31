// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/modules/theme/presenter/stores/theme_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.themeStore,
  });

  final ThemeStore themeStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Arch Flutterando'),
        actions: [
          IconButton(
            onPressed: themeStore.changeTheme,
            icon: Icon(themeStore.isDark ? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('bloc/'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Bloc'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              onPressed: () => Modular.to.pushNamed('triple/'),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Triple'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('notifier/'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Notifier'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('cubit/'),
              style: ElevatedButton.styleFrom(fixedSize: const Size(200, 50)),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text('Cubit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
