import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controllers/form_notifier_controller.dart';
import 'presenter/pages/form_page.dart';
import 'presenter/pages/home_notifier_page.dart';
import 'presenter/stores/form_notifier.dart';
import 'presenter/stores/todo_notifier.dart';

class NotifierModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // Notifier
    Bind.lazySingleton((i) => TodoNotifier(i())),
    Bind.factory((i) => FormNotifier(i())),

    // Controllers
    Bind.factory((i) => FormNotifierController(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomeNotifierPage(
        todoNotifier: Modular.get<TodoNotifier>(),
      ),
    ),
    ChildRoute(
      '/form',
      child: (_, __) => FormNotifierPage(
        formController: Modular.get<FormNotifierController>(),
      ),
    ),
  ];
}
