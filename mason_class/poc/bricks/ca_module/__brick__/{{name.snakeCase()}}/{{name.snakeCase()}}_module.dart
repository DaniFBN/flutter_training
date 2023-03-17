import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/{{name.snakeCase()}}_page.dart';

class {{name.pascalCase()}}Module extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const {{name.pascalCase()}}Page(),
    ),
  ];
}

