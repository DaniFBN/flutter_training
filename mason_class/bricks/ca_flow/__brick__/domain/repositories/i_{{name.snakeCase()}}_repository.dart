import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';

abstract class I{{name.pascalCase()}}Repository{
  Future<Either<AppException, void>> {{name.camelCase()}}();
}