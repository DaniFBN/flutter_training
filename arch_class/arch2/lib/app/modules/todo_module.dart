import 'package:arch2/app/modules/todo/submodules/notifier/presenter/controllers/form_notifier_controller.dart';
import 'package:arch2/app/modules/todo/presentation/reactivities/triples/todo_triple.dart';
import 'package:arch2/app/modules/todo/presentation/reactivities/value_notifiers/todo_notifier.dart';
import 'package:arch2/app/modules/todo/submodules/triple/triple_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'todo/data/datasources/datasources.dart';
import 'todo/data/repositories/repositories.dart';
import 'todo/domain/usecases/usecases.dart';
import 'todo/presentation/reactivities/value_notifiers/form_notifier.dart';
import 'todo/presentation/views/home_page.dart';

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

    // Triple
    Bind.lazySingleton((i) => TodoTriple(i())),

    // Controllers
    Bind.factory((i) => FormController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const HomePage(),
    ),
    ModuleRoute('/triple', module: TripleModule()),
    // ChildRoute(
    //   '/form',
    //   child: (_, __) => FormPage(
    //     formController: Modular.get<FormController>(),
    //   ),
    // ),
  ];
}
