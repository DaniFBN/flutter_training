import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_manager3/app/presenter/cubit/add_person_cubit.dart';

import '../../core/value_objects/email_vo.dart';
import '../../domain/params/create_person_param.dart';
import '../cubit/state/add_person_state.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final AddPersonCubit cubit;

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'TESTE 2');
  final emailController = TextEditingController(text: 'dani.noronha@fteam.dev');
  final cpfController = TextEditingController(text: '330.786.970-10');
  final birthAtController = TextEditingController(text: '1999-12-12');
  late final StreamSubscription cubitSubscription;

  @override
  void initState() {
    super.initState();

    cubitSubscription = widget.cubit.stream.listen(
      (event) {
        if (event is SuccessAddPersonState) {
          showDialog(
            context: context,
            builder: (context) {
              return const Dialog(
                child: Center(
                  child: Text('Deu certo'),
                ),
              );
            },
          );
        } else if (event is FailureAddPersonState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(event.message)),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    cubitSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Person')),
      body: Column(
        children: [
          BlocBuilder<AddPersonCubit, AddPersonState>(
            bloc: widget.cubit,
            builder: (context, state) {
              switch (state) {
                case LoadingAddPersonState():
                  return const LinearProgressIndicator();
                default:
                  return const SizedBox();
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: birthAtController,
                      decoration: const InputDecoration(
                        labelText: 'Data de nascimento',
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: cpfController,
                      decoration: const InputDecoration(labelText: 'CPF'),
                    ),
                    const SizedBox(height: 8),
                    ATextFormField(
                      controller: emailController,
                      labelText: 'Email',
                      validator: EmailVO.validate,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final isValid = formKey.currentState!.validate();
                        if (!isValid) return;

                        final birthAt =
                            DateTime.tryParse(birthAtController.text) ??
                                DateTime.now();

                        final email = emailController.text.isEmpty
                            ? null
                            : EmailVO(emailController.text);

                        final param = CreatePersonParam(
                          name: nameController.text,
                          birthAt: birthAt,
                          cpf: cpfController.text,
                          email: email,
                        );
                        widget.cubit.create(param);
                      },
                      child: const Text('Adicionar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ATextFormField extends StatelessWidget {
  const ATextFormField({
    Key? key,
    required this.controller,
    this.labelText,
    this.isRequired = false,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String? labelText;
  final bool isRequired;
  final String? Function(String value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      validator: (value) {
        if (value == null || (isRequired && value.isEmpty)) {
          return 'Campo obrigatório';
        }

        if (!isRequired == value.isEmpty) return null;
        if (validator == null) return null;

        return validator!(value);
      },
    );
  }
}
