import 'package:fpdart/fpdart.dart';

import '../../../../shared/interfaces/app_failure.dart';
import '../enums/theme_enum.dart';
import '../repositories/theme_repository.dart';

abstract class GetThemeUsecase {
  Future<Either<AppFailure, AppTheme>> call();
}

class GetThemeUsecaseImpl implements GetThemeUsecase {
  const GetThemeUsecaseImpl(this._repository);
  final ThemeRepository _repository;

  @override
  Future<Either<AppFailure, AppTheme>> call() {
    return _repository.getTheme();
  }
}
