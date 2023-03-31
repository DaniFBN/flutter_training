import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controllers/form_triple_controller.dart';
import 'presenter/pages/form_triple_page.dart';
import 'presenter/pages/home_triple_page.dart';
import 'presenter/stores/form_triple.dart';
import 'presenter/stores/todo_triple.dart';

class TripleModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // Triple
    Bind.lazySingleton((i) => TodoTriple(i())),
    Bind.lazySingleton((i) => FormTriple(i())),

    // Controllers
    Bind.factory((i) => FormTripleController(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomeTriplePage(
        todoTriple: Modular.get<TodoTriple>(),
      ),
    ),
    ChildRoute(
      '/form',
      child: (_, __) => FormTriplePage(
        formController: Modular.get<FormTripleController>(),
      ),
    ),
  ];
}
