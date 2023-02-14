import 'package:arch_class2/app/core/core_module.dart';
import 'package:arch_class2/app/modules/user/user_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/user', module: UserModule()),
  ];
}
