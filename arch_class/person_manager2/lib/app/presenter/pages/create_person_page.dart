import 'package:flutter/material.dart';
import 'package:person_manager2/app/domain/params/create_person_param.dart';
import 'package:person_manager2/app/presenter/pages/widgets/date_field.dart';
import 'package:person_manager2/app/presenter/stores/create_person_state.dart';
import 'package:person_manager2/app/presenter/stores/create_person_store.dart';

import 'widgets/custom_field.dart';
import 'widgets/custom_text_field.dart';

class CreatePersonPage extends StatefulWidget {
  const CreatePersonPage({
    Key? key,
    required this.store,
  }) : super(key: key);

  final CreatePersonStore store;

  @override
  State<CreatePersonPage> createState() => _CreatePersonPageState();
}

class _CreatePersonPageState extends State<CreatePersonPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Daniel @');
  final cpfController = TextEditingController(text: '1231231231');
  final birthController =
      TextEditingController(text: '2023-07-12 00:00:00.000');
  final emailController = TextEditingController(text: 'devfteam.dev');

  @override
  void initState() {
    super.initState();

    widget.store.addListener(storeListener);
  }

  void storeListener() {
    final state = widget.store.value;
    if (state is ErrorCreatePersonState) {
      final snackBar = SnackBar(content: Text(state.exception.message));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is SuccessCreatePersonState) {
      const snackBar = SnackBar(content: Text('Cadastrado com sucesso'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    widget.store.removeListener(storeListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar pessoa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomField(
                label: 'Nome',
                isRequired: true,
                field: CustomTextField(
                  autofill: const [AutofillHints.name],
                  hintText: 'Digite seu nome',
                  controller: nameController,
                  required: true,
                  validator: (value) {
                    // if (!value!.contains('@')) {
                    //   return 'Email inválido';
                    // }

                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              CustomField(
                label: 'CPF',
                isRequired: true,
                field: CustomTextField(
                  hintText: 'Digite seu cpf',
                  controller: cpfController,
                  required: true,
                  validator: (value) {
                    // if (!value!.contains('@')) {
                    //   return 'Email inválido';
                    // }

                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              DateField(controller: birthController),
              const SizedBox(height: 16),
              CustomField(
                label: 'Email',
                field: CustomTextField(
                  autofill: const [AutofillHints.email],
                  hintText: 'Digite seu email',
                  controller: emailController,
                  required: false,
                  validator: (value) {
                    // if (!value!.contains('@')) {
                    //   return 'Email inválido';
                    // }

                    return null;
                  },
                ),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder(
                valueListenable: widget.store,
                child: ElevatedButton(
                  onPressed: () async {
                    final isValid = formKey.currentState!.validate();
                    if (!isValid) return;

                    final param = CreatePersonParam(
                      name: nameController.text,
                      cpf: cpfController.text,
                      birth: DateTime.parse(birthController.text),
                      email: emailController.text.isEmpty
                          ? null
                          : emailController.text,
                    );

                    await widget.store.create(param);
                  },
                  child: const Text('Create'),
                ),
                builder: (_, state, button) {
                  if (state is LoadingCreatePersonState) {
                    return const CircularProgressIndicator();
                  }
                  return button!;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
