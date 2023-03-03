import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';
import 'package:modular_example/app/modules/blue/blue_guard.dart';
import 'package:modular_example/app/modules/blue/blue_page.dart';

import '../../core/shared/app_routes.dart';
import 'special_blue_page.dart';

class BlueModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      AppRoutes.bluePagePath,
      child: (context, __) => BluePage(colorStore: context.read<ColorStore>()),
    ),
    ChildRoute(
      AppRoutes.specialBluePagePath,
      child: (context, __) => SpecialBluePage(
        colorStore: Modular.get<ColorStore>(),
      ),
      guards: [SpecialBlueGuard()],
    )
  ];
}
