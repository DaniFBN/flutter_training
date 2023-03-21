import 'package:arch2/app/core/shared/services/local_storage/shared_preferences_local_storage_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton(
      (i) => SharedPreferencesLocalStorageService(),
      export: true,
    ),
  ];
}
