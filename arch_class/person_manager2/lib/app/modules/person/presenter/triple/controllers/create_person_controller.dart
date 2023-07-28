import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager2/app/core/services/snack_bar/i_snack_bar_service.dart';
import 'package:person_manager2/app/core/value_objects/email_vo.dart';
import 'package:person_manager2/app/modules/person/presenter/triple/stores/create_person_store.dart';
import 'package:person_manager2/app/modules/person/presenter/triple/stores/persons_store.dart';

import '../../../domain/params/create_person_param.dart';

class CreatePersonController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: 'Daniel A');
  final cpfController = TextEditingController(text: '12312312312');
  final emailController = TextEditingController(text: 'dev@fteam.dev');
  final birthController = TextEditingController(
    text: '1995-07-12 00:00:00.000',
  );

  final CreatePersonStore createStore;
  final PersonsStore _personsStore;
  final ISnackBarService _snackBarService;
  late final VoidCallback createStoreDisposer;

  CreatePersonController({
    required this.createStore,
    required PersonsStore personsStore,
    required ISnackBarService snackBarService,
  })  : _personsStore = personsStore,
        _snackBarService = snackBarService {
    createStoreDisposer = createStore.observer(
      onError: (error) {
        final snackBar = SnackBar(content: Text(error.message));
        _snackBarService.showSnackBar(snackBar);
      },
      onState: (state) {
        const snackBar = SnackBar(content: Text('Cadastrado com sucesso'));
        _snackBarService.showSnackBar(snackBar);

        _personsStore.getPersons();
        Modular.to.pop();
      },
    );
  }

  void create() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    EmailVO? email;
    if (emailController.text.isNotEmpty) {
      email = EmailVO(emailController.text);
    }

    final param = CreatePersonParam(
      name: nameController.text,
      cpf: cpfController.text,
      birth: DateTime.parse(birthController.text),
      email: email,
    );

    await createStore.create(param);
  }

  void dispose() {
    createStoreDisposer();
  }
}
