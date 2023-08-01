import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/modules/person/presenter/bloc/stores/events/create_person_event.dart';
import 'package:person_manager/app/modules/person/presenter/bloc/stores/events/persons_event.dart';

import '../../../../../core/services/snack_bar/snack_bar_service.dart';
import '../../../domain/entities/person_entity.dart';
import '../../../domain/params/create_person_param.dart';
import '../stores/create_person_store.dart';
import '../stores/persons_store.dart';
import '../stores/states/create_person_state.dart';

class CreatePersonController {
  final CreatePersonStore store;
  final PersonsStore personsStore;
  final ISnackBarService _snackBarService;

  late final StreamSubscription _storeSubscription;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final birthController = TextEditingController();
  Sexo selectedSexo = Sexo.feminino;
  final telephoneController = TextEditingController();

  CreatePersonController(this.store, this.personsStore, this._snackBarService) {
    _storeSubscription = store.stream.listen(_storeListener);
  }

  Future<void> create() async {
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

    store.add(SubmitCreatePersonEvent(param));
  }

  void _storeListener(CreatePersonState state) {
    switch (state) {
      case ErrorCreatePersonState():
        final snackBar = SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.failure.message),
        );
        _snackBarService.showSnackBar(snackBar);
      case SuccessCreatePersonState():
        const snackBar = SnackBar(
          backgroundColor: Colors.green,
          content: Text('Pessoa criada com sucesso'),
        );
        _snackBarService.showSnackBar(snackBar);
        personsStore.add(const GetPersonsEvent());
        Modular.to.pop();
      default:
        return;
    }
  }

  void dispose() {
    _storeSubscription.cancel();
  }
}
