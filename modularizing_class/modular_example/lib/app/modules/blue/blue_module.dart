import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';
import 'package:modular_example/app/modules/blue/blue_guard.dart';
import 'package:modular_example/app/modules/blue/blue_page.dart';

import 'special_blue_page.dart';

class BlueModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, __) => BluePage(colorStore: context.read<ColorStore>()),
    ),
    ChildRoute(
      '/special',
      child: (context, __) => SpecialBluePage(
        colorStore: Modular.get<ColorStore>(),
      ),
      guards: [SpecialBlueGuard()],
    )
  ];
}
