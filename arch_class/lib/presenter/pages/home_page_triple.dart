// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:arch_class/app_exception.dart';
import 'package:arch_class/domain/entities/user_entity.dart';
import 'package:arch_class/domain/helpers/params.dart';
import 'package:arch_class/domain/value_objects/name_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../reatividade/triple/user_triple.dart';

class HomePageTriple extends StatelessWidget {
  final UserTriple userTriple;
  final controller = TextEditingController();

  HomePageTriple({
    Key? key,
    required this.userTriple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arch Class - Triple')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(controller: controller),
            Expanded(
              child: ScopedBuilder<UserTriple, AppException, List<UserEntity>>(
                store: userTriple,
                onError: (_, error) {
                  return Center(child: Text(error!.message));
                },
                onLoading: (_) {
                  return const Center(child: CircularProgressIndicator());
                },
                onState: (context, state) {
                  if (state.isEmpty) {
                    return const Center(child: Text('Cadastre seus usuários'));
                  }
                  return ListView.separated(
                    itemCount: state.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, index) {
                      final user = state.elementAt(index);

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

          userTriple.createUser(param);
          controller.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
