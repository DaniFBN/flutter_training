import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../core/shared/services/navigation_service.dart';
import '../../../../../../core/shared/services/snackbar/snackbar_service.dart';
import '../../../../domain/failures/failures.dart';
import '../../../../domain/params/create_todo_param.dart';
import '../stores/form_triple.dart';
import '../stores/todo_triple.dart';

class FormTripleController {
  FormTripleController(
    this.todoTriple,
    this.formTriple,
    this._snackBarService,
  ) {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    userIDController = TextEditingController();
    descriptionController = TextEditingController();

    _disposer = formTriple.observer(
      onError: _showSnackBar,
    );
  }
  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController userIDController;
  late final TextEditingController descriptionController;
  late final Disposer _disposer;

  final TodoTriple todoTriple;

  final FormTriple formTriple;
  final SnackBarService _snackBarService;

  void _showSnackBar(failure) {
    _snackBarService.showSnackBar((failure as TodoFailure).message);
  }

  Future<void> addTodo() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    final param = CreateTodoParam(
      userID: userIDController.text,
      name: titleController.text,
      description: descriptionController.text,
    );
    await formTriple.create(param);

    if (formTriple.isSuccess) {
      await todoTriple.getTodos(userIDController.text);
      NavigationService.instance.pop();
    }
  }

  void dispose() {
    _disposer();
  }
}
