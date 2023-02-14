import 'dart:math';

import 'package:flutter/material.dart';

import '../../domain/helpers/params.dart';
import '../../domain/value_objects/name_type.dart';
import '../reatividade/notifier/user_notifier.dart';
import '../reatividade/notifier/user_state.dart';

class HomePageNotifier extends StatelessWidget {
  final UserNotifier userNotifier;
  final controller = TextEditingController();

  HomePageNotifier({
    Key? key,
    required this.userNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arch Class - Notifier')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: controller),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: userNotifier,
                builder: (_, state, __) {
                  if (state is InitialUserState) {
                    return const Center(child: Text('Cadastre seus usuários'));
                  }

                  if (state is LoadingUserState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ErrorUserState) {
                    return Center(child: Text(state.error.message));
                  }

                  final successState = state as SuccessUserState;
                  return ListView.separated(
                    itemCount: successState.users.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, index) {
                      final user = successState.users.elementAt(index);

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(user.name.value),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final random = Random();
          final param = CreateUserParam(
            name: NameType(controller.text),
            email: 'email${random.nextInt(5000)}@gmail.com',
            password: random.nextInt(5000).toString(),
            phone: random.nextInt(5000).toString(),
            cpf: random.nextInt(5000).toString(),
            street: 'Street ${random.nextInt(5000).toString()}',
            neighborhood: 'Neighborhood ${random.nextInt(5000).toString()}',
            city: 'City ${random.nextInt(5000).toString()}',
            state: 'State ${random.nextInt(5000).toString()}',
            zipCode: random.nextInt(5000).toString(),
            number: random.nextInt(5000).toString(),
          );

          userNotifier.createUser(param);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
