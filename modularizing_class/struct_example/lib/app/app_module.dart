import 'package:flutter_modular/flutter_modular.dart';
import 'package:struct_example/app/core/modules/theme/theme_module.dart';
import 'package:struct_example/app/core/modules/user/user_module.dart';
import 'package:struct_example/app/modules/rh/rh_module.dart';

import 'modules/fiscal/fiscal_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    UserModule(),
    ThemeModule(),
  ];

  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => const AppModuleBind()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/rh', module: RhModule()),
    ModuleRoute('/fiscal', module: FiscalModule()),
  ];
}

class AppModuleBind {
  const AppModuleBind();
}
