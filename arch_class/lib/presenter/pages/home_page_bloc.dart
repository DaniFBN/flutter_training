// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:arch_class/domain/helpers/params.dart';
import 'package:arch_class/domain/value_objects/name_type.dart';
import 'package:arch_class/presenter/reatividade/blocs/events/user_events.dart';
import 'package:arch_class/presenter/reatividade/blocs/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reatividade/blocs/states/user_state.dart';

class HomePageBloc extends StatelessWidget {
  final UserBloc userBloc;
  final controller = TextEditingController();

  HomePageBloc({
    Key? key,
    required this.userBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arch Class - Bloc')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: controller),
            Expanded(
              child: BlocBuilder(
                bloc: userBloc,
                builder: (BuildContext context, UserState state) {
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

          final event = CreateUserEvent(param);
          userBloc.add(event);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
