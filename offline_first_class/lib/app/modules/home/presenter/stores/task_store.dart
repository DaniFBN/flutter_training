// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/cupertino.dart';
import 'package:offline_first_class/app/modules/home/domain/entities/task_entity.dart';
import 'package:offline_first_class/app/modules/home/domain/usecases/create_task_usecase.dart';

class TaskState {
  final List<TaskEntity> tasks;

  TaskState(this.tasks);
}

class TaskStore extends ValueNotifier<TaskState> {
  final ICreateTaskUsecase _createTaskUsecase;

  TaskStore(
    this._createTaskUsecase,
  ) : super(TaskState([]));

  void create() async {
    final random = Random();
    final name = 'Name ${random.nextInt(9999)}';

    final response = await _createTaskUsecase(name);

    response.fold(
      (l) => log(l.toString()),
      (r) {
        final currentTasks = value.tasks;
        final newState = TaskState([...currentTasks, r]);
        value = newState;
      },
    );
  }
}
