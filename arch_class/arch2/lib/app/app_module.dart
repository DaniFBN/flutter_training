import 'package:arch2/app/core/core_module.dart';
import 'package:arch2/app/core/shared/services/local_storage/local_storage_service.dart';
import 'package:arch2/app/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/todo_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => SplashPage(
        localStorageService: Modular.get<LocalStorageService>(),
      ),
    ),
    ModuleRoute('/todo', module: TodoModule()),
  ];
}
