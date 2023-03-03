import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';
import 'package:modular_example/app/core/shared/app_routes.dart';
import 'package:modular_example/app/modules/green/green_page.dart';

class GreenModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      AppRoutes.greenPagePath,
      child: (context, __) => GreenPage(colorStore: context.read<ColorStore>()),
    )
  ];
}
