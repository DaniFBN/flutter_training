import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/exceptions/app_exception.dart';
import '../../domain/repositories/i_get_user_by_id_repository.dart';
import '../datasources/i_get_user_by_id_datasource.dart';

class GetUserByIdRepository implements IGetUserByIdRepository {
  const GetUserByIdRepository(this._datasource);

  final IGetUserByIdDatasource _datasource;

  @override
  Future<Either<AppException, void>> getUserById() async {
    try {
      final response = await _datasource.getUserById();

      return Right(response);
    } on AppException catch (e) {
      return Left(e);
    }
  }
}
