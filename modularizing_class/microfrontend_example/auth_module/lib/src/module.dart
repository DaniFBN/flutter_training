import 'package:app_dependencies/app_dependencies.dart';
import 'package:auth_module/src/pages/login_page.dart';
import 'package:core_module/core_module.dart';

class AuthModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.loginPagePath, child: (_, __) => const LoginPage())
  ];
}
