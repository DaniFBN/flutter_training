import 'dart:async';

import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:arch2/app/core/shared/services/snackbar/snackbar_service.dart';
import 'package:arch2/app/modules/todo/domain/failures/failures.dart';
import 'package:arch2/app/modules/todo/domain/params/create_todo_param.dart';
import 'package:arch2/app/modules/todo/submodules/bloc/presenter/blocs/events/form_bloc_event.dart';
import 'package:arch2/app/modules/todo/submodules/bloc/presenter/blocs/events/todo_bloc_event.dart';
import 'package:arch2/app/modules/todo/submodules/bloc/presenter/blocs/states/form_bloc_state.dart';
import 'package:flutter/material.dart';

import '../blocs/form_bloc.dart';
import '../blocs/todo_bloc.dart';

class FormBlocController {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController titleController;
  late final TextEditingController userIDController;
  late final TextEditingController descriptionController;
  late final StreamSubscription _subscription;

  final TodoBloc todoBloc;
  final FormBloc formBloc;
  final SnackBarService _snackBarService;

  FormBlocController(
    this.todoBloc,
    this.formBloc,
    this._snackBarService,
  ) {
    formKey = GlobalKey<FormState>();
    titleController = TextEditingController();
    userIDController = TextEditingController();
    descriptionController = TextEditingController();

    _subscription = formBloc.stream.listen((event) {
      if (event is ErrorFormBlocState) {
        _showSnackBar(event.failure);
      } else if (event is SuccessFormBlocState) {
        todoBloc.add(GetAllTodoBlocEvent(userIDController.text));
        NavigationService.instance.pop();
      }
    });
  }

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
    final event = CreateTodoFormBlocEvent(param);
    formBloc.add(event);
  }

  void dispose() {
    _subscription.cancel();
  }
}
