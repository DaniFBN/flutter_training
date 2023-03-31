// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../shared/interfaces/app_failure.dart';
import '../../domain/enums/theme_enum.dart';
import '../../domain/usecases/change_theme_usecase.dart';
import '../../domain/usecases/get_theme_usecase.dart';

class ThemeStore extends NotifierStore<AppFailure, AppTheme> {
  final ChangeThemeUsecase _changeThemeUsecase;
  final GetThemeUsecase _getThemeUsecase;

  ThemeStore(this._changeThemeUsecase, this._getThemeUsecase)
      : super(AppTheme.dark);

  bool get isDark => state == AppTheme.dark;

  Future<void> changeTheme() async {
    final newTheme = isDark ? AppTheme.light : AppTheme.dark;
    final result = await _changeThemeUsecase(newTheme);

    result.fold(setError, (r) => update(newTheme));
  }

  Future<void> getTheme() async {
    final result = await _getThemeUsecase();

    result.fold(setError, update);
  }
}
