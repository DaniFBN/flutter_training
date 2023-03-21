import 'package:arch2/app/modules/todo/presentation/controllers/form_controller.dart';
import 'package:arch2/app/modules/todo/presentation/reactivities/value_notifiers/todo_notifier.dart';
import 'package:arch2/app/modules/todo/presentation/views/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'todo/data/datasources/datasources.dart';
import 'todo/data/repositories/repositories.dart';
import 'todo/domain/usecases/usecases.dart';
import 'todo/presentation/reactivities/value_notifiers/form_notifier.dart';
import 'todo/presentation/views/form_page.dart';

class TodoModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // Datasources
    Bind.factory((i) => GetTodoDatasourceImpl(i())),
    Bind.factory((i) => ChangeTodoDatasourceImpl(i())),

    // Repositories
    Bind.factory((i) => GetTodoRepositoryImpl(i())),
    Bind.factory((i) => ChangeTodoRepositoryImpl(i())),

    // Usecases
    Bind.factory((i) => GetAllByUserIDUsecaseImpl(i())),
    Bind.factory((i) => CreateTodoUsecaseImpl(i())),

    // Notifier
    Bind.lazySingleton((i) => TodoNotifier(i())),
    Bind.factory((i) => FormNotifier(i())),

    // Controllers
    Bind.factory((i) => FormController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomePage(
        todoNotifier: Modular.get<TodoNotifier>(),
      ),
    ),
    ChildRoute(
      '/form',
      child: (_, __) => FormPage(
        formController: Modular.get<FormController>(),
      ),
    ),
  ];
}
