import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/core_module.dart';
import 'core/shared/services/local_storage/local_storage_service.dart';
import 'core/shared/services/local_storage/shared_preferences_local_storage_service.dart';
import 'modules/todo_module.dart';
import 'splash_page.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<Bind<Object>> binds = [
    AsyncBind(
      (i) async {
        final sharedPreferences = await SharedPreferences.getInstance();
        return SharedPreferencesLocalStorageService(sharedPreferences);
      },
    ),
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
