import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';

abstract class IGetUserByIdRepository{
  Future<Either<AppException, void>> getUserById();
}