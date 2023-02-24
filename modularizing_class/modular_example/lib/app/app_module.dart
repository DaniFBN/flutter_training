import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/core_module.dart';
import 'package:modular_example/app/modules/blue/blue_module.dart';
import 'package:modular_example/app/modules/not_found_page.dart';
import 'package:modular_example/app/modules/random/random_module.dart';

import 'core/menu/menu_module.dart';
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
      '/blue',
      module: BlueModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.scale,
    ),
    ModuleRoute(
      '/red',
      module: RedModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.leftToRightWithFade,
    ),
    ModuleRoute(
      '/green',
      module: GreenModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.rotate,
    ),
    ModuleRoute(
      '/random',
      module: RandomModule(),
      duration: const Duration(seconds: 1),
      transition: TransitionType.fadeIn,
    ),
    WildcardRoute(child: (_, __) => const NotFoundPage()),
  ];
}
