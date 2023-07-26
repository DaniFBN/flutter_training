import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';
import 'modules/person/person_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: PersonModule()),
  ];
}
