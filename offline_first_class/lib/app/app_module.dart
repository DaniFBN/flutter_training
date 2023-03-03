import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:offline_first_class/app/core/shared/services/connection/plus_connection_service.dart';
import 'package:offline_first_class/app/core/shared/services/local_storage/helpers/params.dart';
import 'package:offline_first_class/app/core/shared/services/local_storage/shared_preferences_local_storage_service.dart';
import 'package:offline_first_class/app/modules/home/home_module.dart';

import 'core/offline_sync/offline_sync_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    OfflineSyncModule(),
  ];

  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => Connectivity()),
    Bind.lazySingleton((i) => PlusConnectionService(i())),
    Bind.lazySingleton((i) => const SharedPreferencesLocalStorageService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];
}
