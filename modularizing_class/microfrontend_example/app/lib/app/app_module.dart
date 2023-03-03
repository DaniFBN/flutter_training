import 'package:app_dependencies/app_dependencies.dart';
import 'package:auth_module/auth_module.dart';
import 'package:core_module/core_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(AppRoutes.authModulePath, module: AuthModule()),
  ];
}
