import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:person_manager/app/modules/person/domain/params/create_person_param.dart';
import 'package:person_manager/app/modules/person/presenter/pages/widgets/custom_field_widget.dart';
import 'package:person_manager/app/modules/person/presenter/stores/create_person_store.dart';
import 'package:person_manager/app/modules/person/presenter/stores/persons_store.dart';
import 'package:person_manager/app/modules/person/presenter/stores/states/create_person_state.dart';

import '../../../../core/formatters/cpf_formatter.dart';
import '../../domain/entities/person_entity.dart';
import 'widgets/custom_text_field_widget.dart';
import 'widgets/date_field_widget.dart';
import 'widgets/dropdown_field_widget.dart';

class CreatePersonPage extends StatefulWidget {
  const CreatePersonPage({
    Key? key,
    required this.store,
    required this.personsStore,
  }) : super(key: key);

  final CreatePersonStore store;
  final PersonsStore personsStore;

  @override
  State<CreatePersonPage> createState() => _CreatePersonPageState();
}

class _CreatePersonPageState extends State<CreatePersonPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final birthController = TextEditingController();
  Sexo selectedSexo = Sexo.feminino;
  final telephoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    widget.store.addListener(storeListener);
  }

  void storeListener() {
    final state = widget.store.value;

    switch (state) {
      case ErrorCreatePersonState():
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.failure.message),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      case SuccessCreatePersonState():
        const snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Text('Pessoa criada com sucesso'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        widget.personsStore.getPersons();
        Navigator.of(context).pop();
      default:
        return;
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
      appBar: AppBar(title: const Text('Cadastrar pessoa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomFieldWidget(
                label: 'Nome',
                isRequired: true,
                field: CustomTextFieldWidget(
                  autofill: const [AutofillHints.name],
                  hintText: 'Digite seu nome',
                  controller: nameController,
                  isRequired: true,
                ),
              ),
              const SizedBox(height: 16),
              CustomFieldWidget(
                label: 'CPF',
                isRequired: true,
                field: CustomTextFieldWidget(
                  hintText: 'Digite seu cpf',
                  controller: cpfController,
                  isRequired: true,
                  keyboardType: TextInputType.number,
                  formatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DateFieldWidget(controller: birthController),
              const SizedBox(height: 16),
              DropdownFieldWidget(
                value: selectedSexo.name,
                values: Sexo.values.map((e) => e.name).toList(),
                onChanged: (String value) {
                  final newValue = Sexo.values.byName(value);
                  selectedSexo = newValue;
                },
              ),
              const SizedBox(height: 16),
              CustomFieldWidget(
                label: 'Telefone',
                field: CustomTextFieldWidget(
                  hintText: 'Digite seu telefone',
                  controller: telephoneController,
                  keyboardType: TextInputType.phone,
                  formatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder(
                valueListenable: widget.store,
                child: ElevatedButton(
                  onPressed: () async {
                    final isValid = formKey.currentState!.validate();
                    if (!isValid) return;

                    final telephone = telephoneController.text;

                    final param = CreatePersonParam(
                      name: nameController.text,
                      cpf: cpfController.text,
                      birthAt: DateTime.parse(birthController.text),
                      sexo: selectedSexo,
                      telephone: telephone.isEmpty ? null : telephone,
                    );

                    await widget.store.create(param);
                  },
                  child: const Text('Cadastrar'),
                ),
                builder: (_, state, child) {
                  Widget body;

                  switch (state) {
                    case LoadingCreatePersonState():
                      body = const CircularProgressIndicator();
                    default:
                      body = child!;
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
