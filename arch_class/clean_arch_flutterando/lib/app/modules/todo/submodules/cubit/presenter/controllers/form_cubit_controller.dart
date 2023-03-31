import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../core/shared/services/navigation_service.dart';
import '../../../../../../core/shared/services/snackbar/snackbar_service.dart';
import '../../../../domain/failures/failures.dart';
import '../../../../domain/params/create_todo_param.dart';
import '../cubits/form_cubit.dart';
import '../cubits/states/form_cubit_state.dart';
import '../cubits/todo_cubit.dart';

class FormCubitController {
  FormCubitController(
    this.todoCubit,
    this.formCubit,
    this._snackBarService,
  ) {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    userIDController = TextEditingController();
    descriptionController = TextEditingController();

    _subscription = formCubit.stream.listen((state) {
      if (state is ErrorFormCubitState) {
        _showSnackBar(state.failure);
      } else if (state is SuccessFormCubitState) {
        todoCubit.getTodos(userIDController.text);
        NavigationService.instance.pop();
      }
    });
  }
  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController userIDController;
  late final TextEditingController descriptionController;
  late final StreamSubscription _subscription;

  final TodoCubit todoCubit;
  final FormCubit formCubit;
  final SnackBarService _snackBarService;

  void _showSnackBar(TodoFailure failure) {
    _snackBarService.showSnackBar(failure.message);
  }

  Future<void> addTodo() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    final param = CreateTodoParam(
      userID: userIDController.text,
      name: titleController.text,
      description: descriptionController.text,
    );

    await formCubit.create(param);
  }

  void dispose() {
    _subscription.cancel();
  }
}
