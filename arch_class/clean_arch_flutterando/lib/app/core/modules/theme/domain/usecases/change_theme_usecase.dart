import 'package:fpdart/fpdart.dart';

import '../../../../shared/interfaces/app_failure.dart';
import '../enums/theme_enum.dart';
import '../repositories/theme_repository.dart';

abstract class ChangeThemeUsecase {
  Future<Either<AppFailure, bool>> call(AppTheme theme);
}

class ChangeThemeUsecaseImpl implements ChangeThemeUsecase {
  const ChangeThemeUsecaseImpl(this._repository);
  final ThemeRepository _repository;

  @override
  Future<Either<AppFailure, bool>> call(AppTheme theme) {
    return _repository.changeTheme(theme);
  }
}
