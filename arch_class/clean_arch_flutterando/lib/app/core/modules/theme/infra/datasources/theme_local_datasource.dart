import '../../domain/enums/theme_enum.dart';

abstract class ThemeLocalDatasource {
  Future<bool> changeTheme(AppTheme theme);
  Future<AppTheme> getTheme();
}
