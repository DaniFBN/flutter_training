import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/formatters/cpf_formatter.dart';
import '../../../domain/entities/person_entity.dart';
import '../controllers/create_person_controller.dart';
import '../stores/states/create_person_state.dart';
import 'widgets/custom_field_widget.dart';
import 'widgets/custom_text_field_widget.dart';
import 'widgets/date_field_widget.dart';
import 'widgets/dropdown_field_widget.dart';

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
      appBar: AppBar(title: const Text('Cadastrar pessoa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomFieldWidget(
                label: 'Nome',
                isRequired: true,
                field: CustomTextFieldWidget(
                  autofill: const [AutofillHints.name],
                  hintText: 'Digite seu nome',
                  controller: controller.nameController,
                  isRequired: true,
                ),
              ),
              const SizedBox(height: 16),
              CustomFieldWidget(
                label: 'CPF',
                isRequired: true,
                field: CustomTextFieldWidget(
                  hintText: 'Digite seu cpf',
                  controller: controller.cpfController,
                  isRequired: true,
                  keyboardType: TextInputType.number,
                  formatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DateFieldWidget(controller: controller.birthController),
              const SizedBox(height: 16),
              DropdownFieldWidget(
                value: controller.selectedSexo.name,
                values: Sexo.values.map((e) => e.name).toList(),
                onChanged: (String value) {
                  final newValue = Sexo.values.byName(value);
                  controller.selectedSexo = newValue;
                },
              ),
              const SizedBox(height: 16),
              CustomFieldWidget(
                label: 'Telefone',
                field: CustomTextFieldWidget(
                  hintText: 'Digite seu telefone',
                  controller: controller.telephoneController,
                  keyboardType: TextInputType.phone,
                  formatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder(
                bloc: controller.store,
                builder: (_, state) {
                  Widget body;

                  switch (state) {
                    case LoadingCreatePersonState():
                      body = const CircularProgressIndicator();
                    default:
                      body = ElevatedButton(
                        onPressed: controller.create,
                        child: const Text('Cadastrar'),
                      );
                  }

                  return body;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
