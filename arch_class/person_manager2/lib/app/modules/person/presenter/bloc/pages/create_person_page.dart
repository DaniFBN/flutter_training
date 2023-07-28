import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_manager2/app/core/value_objects/email_vo.dart';
import 'package:person_manager2/app/modules/person/presenter/bloc/controllers/create_person_controller.dart';
import 'package:person_manager2/app/modules/person/presenter/bloc/pages/widgets/date_field.dart';
import 'package:person_manager2/app/modules/person/presenter/bloc/stores/states/create_person_state.dart';

import 'widgets/custom_field.dart';
import 'widgets/custom_text_field.dart';

class CreatePersonPage extends StatefulWidget {
  const CreatePersonPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CreatePersonController controller;
  @override
  State<CreatePersonPage> createState() => _CreatePersonPageState();
}

class _CreatePersonPageState extends State<CreatePersonPage> {
  CreatePersonController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar pessoa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomField(
                label: 'Nome',
                isRequired: true,
                field: CustomTextField(
                  autofill: const [AutofillHints.name],
                  hintText: 'Digite seu nome',
                  controller: controller.nameController,
                  required: true,
                ),
              ),
              const SizedBox(height: 16),
              CustomField(
                label: 'CPF',
                isRequired: true,
                field: CustomTextField(
                  hintText: 'Digite seu cpf',
                  controller: controller.cpfController,
                  required: true,
                ),
              ),
              const SizedBox(height: 16),
              DateField(controller: controller.birthController),
              const SizedBox(height: 16),
              CustomField(
                label: 'Email',
                field: CustomTextField(
                  autofill: const [AutofillHints.email],
                  hintText: 'Digite seu email',
                  controller: controller.emailController,
                  required: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) return null;

                    return EmailVO(value).error;
                  },
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder(
                bloc: controller.createStore,
                builder: (_, state) {
                  if (state is LoadingCreatePersonState) {
                    return const CircularProgressIndicator();
                  }

                  return ElevatedButton(
                    onPressed: controller.create,
                    child: const Text('Create'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
