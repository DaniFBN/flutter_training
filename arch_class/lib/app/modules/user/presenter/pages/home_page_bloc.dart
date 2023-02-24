// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:arch_class2/app/modules/user/presenter/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/helpers/params.dart';
import '../../domain/value_objects/name_type.dart';
import '../reatividade/blocs/states/user_form_state.dart';
import '../reatividade/blocs/states/users_state.dart';

class HomePageBloc extends StatefulWidget {
  final UserController userController;

  const HomePageBloc({
    Key? key,
    required this.userController,
  }) : super(key: key);

  @override
  State<HomePageBloc> createState() => _HomePageBlocState();
}

class _HomePageBlocState extends State<HomePageBloc> {
  @override
  void initState() {
    super.initState();

    widget.userController.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Arch Class - Bloc')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder(
          bloc: widget.userController.usersBloc,
          builder: (BuildContext context, UsersState state) {
            if (state is InitialUsersState) {
              return const Center(child: Text('Cadastre seus usuários'));
            }

            if (state is LoadingUsersState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ErrorUsersState) {
              return Center(child: Text(state.error.message));
            }

            final successState = state as SuccessUsersState;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            isDismissible: false,
            enableDrag: false,
            builder: (context) {
              return AddUserModalWidget(
                userController: widget.userController,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddUserModalWidget extends StatelessWidget {
  AddUserModalWidget({
    Key? key,
    required this.userController,
  }) : super(key: key);

  final UserController userController;

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cadastrar usuário',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                label: Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey.shade700,
                    ),
                    const SizedBox(width: 8),
                    const Text('Nome'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder(
                bloc: userController.formBloc,
                builder: (BuildContext context, UserFormState state) {
                  bool enableInsert = false;
                  bool enableCancel = true;
                  String? errorMessage;
                  Widget insertChild = const Text('Cadastrar');

                  if (state is InitialUserFormState) {
                    enableInsert = true;
                  }

                  if (state is LoadingUserFormState) {
                    enableCancel = false;
                    enableInsert = false;
                    insertChild = const CircularProgressIndicator();
                  }

                  if (state is ErrorUserFormState) {
                    errorMessage = state.error.message;
                    enableCancel = true;
                    enableInsert = true;
                    insertChild = const Text('Cadastrar');
                  }

                  if (state is SuccessUserFormState) {
                    Navigator.pop(context);
                  }

                  return Column(
                    children: [
                      if (errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(errorMessage),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(size.width * 0.4, 44),
                            ),
                            onPressed: enableCancel
                                ? () {
                                    Navigator.pop(context);
                                  }
                                : null,
                            child: const Text('Cancelar'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(size.width * 0.4, 44),
                            ),
                            onPressed: !enableInsert
                                ? null
                                : () {
                                    final random = Random();
                                    final param = CreateUserParam(
                                      name: NameType(controller.text),
                                      email:
                                          'email${random.nextInt(5000)}@gmail.com',
                                      password: random.nextInt(5000).toString(),
                                      phone: random.nextInt(5000).toString(),
                                      cpf: random.nextInt(5000).toString(),
                                      street:
                                          'Street ${random.nextInt(5000).toString()}',
                                      neighborhood:
                                          'Neighborhood ${random.nextInt(5000).toString()}',
                                      city:
                                          'City ${random.nextInt(5000).toString()}',
                                      state:
                                          'State ${random.nextInt(5000).toString()}',
                                      zipCode: random.nextInt(5000).toString(),
                                      number: random.nextInt(5000).toString(),
                                    );
                                    userController.createUser(param);
                                  },
                            child: insertChild,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
