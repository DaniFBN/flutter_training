import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:arch2/app/modules/todo/domain/params/create_todo_param.dart';
import 'package:arch2/app/modules/todo/presentation/reactivities/value_notifiers/form_notifier.dart';
import 'package:arch2/app/modules/todo/presentation/reactivities/value_notifiers/todo_notifier.dart';
import 'package:flutter/material.dart';

class FormNotifierController {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController userIDController;
  late final TextEditingController descriptionController;

  final TodoNotifier todoNotifier;
  final FormNotifier formNotifier;

  FormNotifierController(
    this.todoNotifier,
    this.formNotifier,
  ) {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    userIDController = TextEditingController();
    descriptionController = TextEditingController();
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
}
