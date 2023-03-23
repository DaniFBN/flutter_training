import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/blocs/form_bloc.dart';
import 'presenter/blocs/todo_bloc.dart';
import 'presenter/controllers/form_bloc_controller.dart';
import 'presenter/pages/form_bloc_page.dart';
import 'presenter/pages/home_Bloc_page.dart';

class BlocModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // Bloc
    Bind.lazySingleton((i) => TodoBloc(i())),
    Bind.factory((i) => FormBloc(i())),

    // Controllers
    Bind.factory((i) => FormBlocController(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomeBlocPage(
        todoBloc: Modular.get<TodoBloc>(),
      ),
    ),
    ChildRoute(
      '/form',
      child: (_, __) => FormBlocPage(
        formController: Modular.get<FormBlocController>(),
      ),
    ),
  ];
}
