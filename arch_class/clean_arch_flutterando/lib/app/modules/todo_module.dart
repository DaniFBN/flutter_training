import 'package:flutter_modular/flutter_modular.dart';

import '../core/modules/theme/presenter/stores/theme_store.dart';
import 'todo/domain/usecases/usecases.dart';
import 'todo/external/datasources/datasources.dart';
import 'todo/infra/repositories/repositories.dart';
import 'todo/presenter/pages/home_page.dart';
import 'todo/submodules/bloc/bloc_module.dart';
import 'todo/submodules/cubit/cubit_module.dart';
import 'todo/submodules/notifier/notifier_module.dart';
import 'todo/submodules/triple/triple_module.dart';

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
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomePage(
        themeStore: Modular.get<ThemeStore>(),
      ),
    ),
    ModuleRoute('/triple', module: TripleModule()),
    ModuleRoute('/notifier', module: NotifierModule()),
    ModuleRoute('/bloc', module: BlocModule()),
    ModuleRoute('/cubit', module: CubitModule()),
  ];
}
