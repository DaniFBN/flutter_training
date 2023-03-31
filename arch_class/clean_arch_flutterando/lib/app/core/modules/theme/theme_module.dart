import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/change_theme_usecase.dart';
import 'domain/usecases/get_theme_usecase.dart';
import 'external/datasources/theme_local_datasource.dart';
import 'infra/repositories/theme_repository.dart';
import 'presenter/stores/theme_store.dart';

class ThemeModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.factory((i) => ThemeLocalDatasourceImpl(i()), export: true),
    Bind.factory((i) => ThemeRepositoryImpl(i()), export: true),
    Bind.factory((i) => ChangeThemeUsecaseImpl(i()), export: true),
    Bind.factory((i) => GetThemeUsecaseImpl(i()), export: true),
    Bind.lazySingleton((i) => ThemeStore(i(), i()), export: true),
  ];
}
