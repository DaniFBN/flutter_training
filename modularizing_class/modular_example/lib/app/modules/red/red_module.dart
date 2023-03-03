import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';
import 'package:modular_example/app/core/shared/app_routes.dart';
import 'package:modular_example/app/modules/red/red_page.dart';

class RedModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      AppRoutes.greenPagePath,
      child: (_, __) => RedPage(colorStore: Modular.get<ColorStore>()),
    )
  ];
}
