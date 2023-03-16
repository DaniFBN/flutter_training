import '../../../domain/entities/entities.dart';
import '../../../domain/params/params.dart';

abstract class GetTodoDatasource {
  Future<Set<TodoEntity>> getAllByUserID(GetAllByUserIDParam param);
}
