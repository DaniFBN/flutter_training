import 'package:fpdart/fpdart.dart';

import '../../domain/entities/entities.dart';
import '../../domain/failures/failures.dart';
import '../../domain/params/params.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/interfaces/get_todo_datasource.dart';

class GetTodoRepositoryImpl implements GetTodoRepository {
  final GetTodoDatasource _datasource;

  const GetTodoRepositoryImpl(this._datasource);

  @override
  Future<Either<TodoFailure, Set<TodoEntity>>> getAllByUserID(
    GetAllByUserIDParam param,
  ) async {
    try {
      final todos = await _datasource.getAllByUserID(param);

      return Right(todos);
    } on TodoFailure catch (e) {
      return Left(e);
    }
  }

  @override
  void getAll() {
    throw UnimplementedError();
  }

  @override
  void getByID() {
    throw UnimplementedError();
  }
}
