import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../repositories/i_{{name.snakeCase()}}_repository.dart';



abstract class I{{name.pascalCase()}}Usecase {
  Future<Either<AppException, void>> call();
}

class {{name.pascalCase()}}Usecase implements I{{name.pascalCase()}}Usecase {
  const {{name.pascalCase()}}Usecase(this._repository);

  final I{{name.pascalCase()}}Repository _repository;

  @override
  Future<Either<AppException, void>>call() async {
    return _repository.{{name.camelCase()}}();
  }
}
