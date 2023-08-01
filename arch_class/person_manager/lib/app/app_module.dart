import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/core/services/local_storage/shared_preferences_local_storage_service.dart';
import 'package:person_manager/app/core/services/snack_bar/messenger_snack_bar_service.dart';
import 'package:person_manager/app/modules/person/person_triple_module.dart';

class AppModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => SharedPreferencesLocalStorageService()),
    Bind.lazySingleton((i) => MessengerSnackBarService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: PersonModule()),
  ];
}
