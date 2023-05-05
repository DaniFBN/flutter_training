import 'package:flutter/material.dart';

import '../../../../../../core/shared/services/navigation_service.dart';
import '../../../../../../core/shared/services/snackbar/snackbar_service.dart';
import '../../../../domain/params/create_todo_param.dart';
import '../stores/form_notifier.dart';
import '../stores/states/form_notifier_state.dart';
import '../stores/todo_notifier.dart';

class FormNotifierController {
  FormNotifierController(
    this.todoNotifier,
    this.formNotifier,
    this._snackBarService,
  ) {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    userIDController = TextEditingController();
    descriptionController = TextEditingController();

    formNotifier.addListener(_formListener);
  }

  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController userIDController;
  late final TextEditingController descriptionController;

  final TodoNotifier todoNotifier;

  final FormNotifier formNotifier;
  final SnackBarService _snackBarService;

  void _formListener() {
    if (formNotifier.hasError) {
      final state = formNotifier.value as ErrorFormNotifierState;
      _snackBarService.showSnackBar(state.failure.message);
    }
  }

  Future<void> addTodo() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    final param = CreateTodoParam(
      userID: userIDController.text,
      name: titleController.text,
      description: descriptionController.text,
    );
    await formNotifier.create(param);

    if (formNotifier.isSuccess) {
      await todoNotifier.getTodos(userIDController.text);
      NavigationService.instance.pop();
    }
  }

  void dispose() {
    formNotifier.removeListener(_formListener);
  }
}
