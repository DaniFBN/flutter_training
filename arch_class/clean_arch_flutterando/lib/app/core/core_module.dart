import 'package:flutter_modular/flutter_modular.dart';

import 'modules/theme/theme_module.dart';
import 'shared/services/snackbar/snackbar_service.dart';

class CoreModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    ...ThemeModule().binds,
    Bind.singleton(
      (i) => SnackBarService.instance,
      export: true,
    ),
  ];
}
