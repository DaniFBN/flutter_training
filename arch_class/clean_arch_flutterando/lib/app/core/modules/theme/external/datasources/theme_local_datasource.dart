// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../shared/services/local_storage/helpers/params.dart';
import '../../../../shared/services/local_storage/local_storage_service.dart';
import '../../domain/enums/theme_enum.dart';
import '../../infra/datasources/theme_local_datasource.dart';

class ThemeLocalDatasourceImpl implements ThemeLocalDatasource {
  final LocalStorageService _localStorageService;

  const ThemeLocalDatasourceImpl(this._localStorageService);

  static const _themeTable = 'theme';
  @override
  Future<bool> changeTheme(AppTheme theme) async {
    final param = CreateLocalStorageParam(
      table: _themeTable,
      data: {'value': theme.name},
    );
    await _localStorageService.save(param);

    return true;
  }

  @override
  Future<AppTheme> getTheme() async {
    final response = await _localStorageService.get(_themeTable);
    final value = response['value'];

    final theme = AppTheme.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AppTheme.dark,
    );

    return theme;
  }
}
