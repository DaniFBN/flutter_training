import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_page.dart';
import 'package:modular_example/app/core/color/color_store.dart';

class ColorModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<ColorStore>(
      (i) => ColorStore(),
      onDispose: (store) => store.dispose(),
      export: true,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/whatever', child: (_, __) => const ColorPage())
  ];
}
