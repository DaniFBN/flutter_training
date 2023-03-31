import 'package:fpdart/fpdart.dart';

import '../../../../shared/interfaces/app_failure.dart';
import '../enums/theme_enum.dart';

abstract class ThemeRepository {
  Future<Either<AppFailure, bool>> changeTheme(AppTheme theme);
  Future<Either<AppFailure, AppTheme>> getTheme();
}
