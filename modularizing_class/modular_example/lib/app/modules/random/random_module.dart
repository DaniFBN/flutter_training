import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';
import 'package:modular_example/app/core/shared/app_routes.dart';

import 'random_page.dart';

// 0xff7a475f

class RandomModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      AppRoutes.randomPagePath,
      child: (context, args) => RandomPage(
        colorStore: context.read<ColorStore>(),
        color: args.data,
      ),
    )
  ];
}
