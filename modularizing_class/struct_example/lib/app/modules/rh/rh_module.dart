import 'package:flutter_modular/flutter_modular.dart';
import 'package:struct_example/app/modules/rh/rh_page.dart';

class RhModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => const RhBind()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const RhPage()),
  ];
}

class RhBind {
  const RhBind();
}
