import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager2/app/core/services/local_storage/shared_preferences_local_storage_service.dart';

import 'services/snack_bar/snack_bar_service.dart';

class CoreModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton(
      (i) => SharedPreferencesLocalStorageService(),
      export: true,
    ),
    Bind.lazySingleton((i) => SnackBarService()),
  ];
}
