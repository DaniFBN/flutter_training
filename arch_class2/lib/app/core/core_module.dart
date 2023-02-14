import 'package:arch_class2/app/core/shared/services/local_storage/hive_local_storage_service.dart';
import 'package:arch_class2/app/core/shared/services/local_storage/i_local_storage_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    // LocalStorageService
    Bind.lazySingleton<ILocalStorageService>(
      (i) => HiveLocalStorageService(),
      export: true,
      onDispose: (value) => value.dispose(),
    ),
  ];
}
