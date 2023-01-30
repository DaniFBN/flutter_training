import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_module.dart';

import 'di/di_module.dart';

class CoreModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    ...ColorModule().binds,
    ...DiModule().binds,
  ];
}
