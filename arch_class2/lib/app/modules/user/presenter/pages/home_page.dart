import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/shared/services/local_storage/i_local_storage_service.dart';

class HomePage extends StatelessWidget {
  final ILocalStorageService localStorageService;

  const HomePage({
    Key? key,
    required this.localStorageService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arch Class'),
        actions: [
          IconButton(
            onPressed: () {
              localStorageService.delete(key: 'user');
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: FutureBuilder(
          future: localStorageService.initialize(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        Modular.to.pushNamed('/user/bloc');
                      },
                      child: const Text('Bloc'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        Modular.to.pushNamed('/user/triple');
                      },
                      child: const Text('Triple'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        Modular.to.pushNamed('/user/notifier');
                      },
                      child: const Text('Notifier'),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
