import 'package:fpdart/fpdart.dart';

import '../../../../shared/interfaces/app_failure.dart';
import '../../domain/enums/theme_enum.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_datasource.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  const ThemeRepositoryImpl(this._datasource);
  final ThemeLocalDatasource _datasource;

  @override
  Future<Either<AppFailure, bool>> changeTheme(AppTheme theme) async {
    try {
      final result = await _datasource.changeTheme(theme);
      return Right(result);
    } on AppFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppFailure, AppTheme>> getTheme() async {
    try {
      final result = await _datasource.getTheme();
      return Right(result);
    } on AppFailure catch (e) {
      return Left(e);
    }
  }
}
