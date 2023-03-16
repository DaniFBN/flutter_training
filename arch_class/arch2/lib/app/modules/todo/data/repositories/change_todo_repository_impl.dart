import 'package:fpdart/fpdart.dart';

import '../../domain/entities/entities.dart';
import '../../domain/failures/failures.dart';
import '../../domain/params/params.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/interfaces/change_todo_datasource.dart';

class ChangeTodoRepositoryImpl implements ChangeTodoRepository {
  final ChangeTodoDatasource _datasource;

  const ChangeTodoRepositoryImpl(this._datasource);
  @override
  Future<Either<TodoFailure, TodoEntity>> create(
    CreateTodoParam param,
  ) async {
    try {
      final todos = await _datasource.createTodo(param);

      return Right(todos);
    } on TodoFailure catch (e) {
      return Left(e);
    } 
    // catch (e) {
    //   // Crashlytics.recordError - mas tem outro jeito, crashlytics_class
    //   rethrow;
    // }
  }

  @override
  void delete() {
    throw UnimplementedError();
  }

  @override
  void update() {
    throw UnimplementedError();
  }
}
