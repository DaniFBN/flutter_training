import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:arch2/app/core/shared/services/snackbar/snackbar_service.dart';
import 'package:arch2/app/modules/todo/domain/params/create_todo_param.dart';
import 'package:arch2/app/modules/todo/submodules/notifier/presenter/stores/form_notifier.dart';
import 'package:arch2/app/modules/todo/submodules/notifier/presenter/stores/states/form_notifier_state.dart';
import 'package:arch2/app/modules/todo/submodules/notifier/presenter/stores/todo_notifier.dart';
import 'package:flutter/material.dart';

class FormNotifierController {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController userIDController;
  late final TextEditingController descriptionController;

  final TodoNotifier todoNotifier;
  final FormNotifier formNotifier;
  final SnackBarService _snackBarService;

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
