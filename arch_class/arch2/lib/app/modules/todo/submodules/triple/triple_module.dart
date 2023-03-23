import 'package:arch2/app/modules/todo/presentation/reactivities/triples/todo_triple.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/home_triple_page.dart';

class TripleModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // Triple
    Bind.lazySingleton((i) => TodoTriple(i())),

    // Controllers
    // Bind.factory((i) => FormController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomeTriplePage(
        todoTriple: Modular.get<TodoTriple>(),
      ),
    ),
    // ChildRoute(
    //   '/form',
    //   child: (_, __) => FormPage(
    //     formController: Modular.get<FormController>(),
    //   ),
    // ),
  ];
}
