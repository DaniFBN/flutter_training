import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/core_module.dart';
import 'package:modular_example/app/modules/blue/blue_module.dart';
import 'package:modular_example/app/modules/not_found_page.dart';
import 'package:modular_example/app/modules/random/random_module.dart';

import 'core/menu/menu_module.dart';
import 'core/shared/app_routes.dart';
import 'modules/green/green_module.dart';
import 'modules/red/red_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => MenuModule()),
    ModuleRoute(
      AppRoutes.blueModulePath,
      module: BlueModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.scale,
    ),
    ModuleRoute(
      AppRoutes.redModulePath,
      module: RedModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.leftToRightWithFade,
    ),
    ModuleRoute(
      AppRoutes.greenModulePath,
      module: GreenModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.rotate,
    ),
    ModuleRoute(
      AppRoutes.randomModulePath,
      module: RandomModule(),
      duration: const Duration(seconds: 5),
      transition: TransitionType.fadeIn,
    ),
    WildcardRoute(child: (_, __) => const NotFoundPage()),
  ];
}
