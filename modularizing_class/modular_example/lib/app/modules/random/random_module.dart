import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';

import 'random_page.dart';

// 0xff7a475f

class RandomModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => RandomPage(
        colorStore: context.read<ColorStore>(),
        color: args.data,
      ),
    )
  ];
}
