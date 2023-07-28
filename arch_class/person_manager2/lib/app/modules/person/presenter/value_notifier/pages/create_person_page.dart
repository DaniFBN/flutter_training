import 'package:flutter/material.dart';
import 'package:person_manager2/app/core/value_objects/email_vo.dart';
import 'package:person_manager2/app/modules/person/presenter/value_notifier/controllers/create_person_controller.dart';
import 'package:person_manager2/app/modules/person/presenter/value_notifier/pages/widgets/date_field.dart';
import 'package:person_manager2/app/modules/person/presenter/value_notifier/stores/states/create_person_state.dart';

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
              ValueListenableBuilder(
                valueListenable: controller.createStore,
                child: ElevatedButton(
                  onPressed: controller.create,
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

// Teste - Usecase
//   throw - return(Either)

// VO
//   hasError

// Page
//   findTextField
//   insertText
//   findButton
//   clickButton
//   findErrorText

// Page - VO
//   TesteVO
  