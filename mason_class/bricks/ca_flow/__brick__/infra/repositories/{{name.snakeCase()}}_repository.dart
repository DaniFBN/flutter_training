import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../../domain/repositories/i_{{name.snakeCase()}}_repository.dart';
import '../datasources/i_{{name.snakeCase()}}_datasource.dart';

class {{name.pascalCase()}}Repository implements I{{name.pascalCase()}}Repository {
  const {{name.pascalCase()}}Repository(this._datasource);

  final I{{name.pascalCase()}}Datasource _datasource;

  @override
  Future<Either<AppException, void>> {{name.camelCase()}}() async {
    try {
      final response = await _datasource.{{name.camelCase()}}();

      return Right(response);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
