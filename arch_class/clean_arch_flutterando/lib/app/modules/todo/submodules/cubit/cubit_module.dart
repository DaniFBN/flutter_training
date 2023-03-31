import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controllers/form_cubit_controller.dart';
import 'presenter/cubits/form_cubit.dart';
import 'presenter/cubits/todo_cubit.dart';
import 'presenter/pages/form_cubit_page.dart';
import 'presenter/pages/home_cubit_page.dart';

class CubitModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // Cubit
    Bind.lazySingleton((i) => TodoCubit(i())),
    Bind.factory((i) => FormCubit(i())),

    // Controllers
    Bind.factory((i) => FormCubitController(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomeCubitPage(
        todoCubit: Modular.get<TodoCubit>(),
      ),
    ),
    ChildRoute(
      '/form',
      child: (_, __) => FormCubitPage(
        formController: Modular.get<FormCubitController>(),
      ),
    ),
  ];
}
