import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_module.dart';
import 'package:modular_example/app/core/core_module.dart';
import 'package:modular_example/app/core/di/di_module.dart';
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
    DiModule(),
    ColorModule(),
  ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: MenuModule());
    r.module(
      AppRoutes.blueModulePath,
      module: BlueModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.scale,
    );
    r.module(
      AppRoutes.redModulePath,
      module: RedModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.leftToRightWithFade,
    );
    r.module(
      AppRoutes.greenModulePath,
      module: GreenModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.rotate,
    );
    r.module(
      AppRoutes.randomModulePath,
      module: RandomModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.fadeIn,
    );
    r.redirect('/redirect', to: '/red/');
    r.wildcard(child: (_) => const NotFoundPage());
  }
}
