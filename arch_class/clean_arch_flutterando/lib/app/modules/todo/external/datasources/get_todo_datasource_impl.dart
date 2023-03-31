import '../../../../core/shared/services/local_storage/helpers/params.dart';
import '../../../../core/shared/services/local_storage/local_storage_service.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/params/get_all_by_user_id_param.dart';
import '../../infra/datasources/get_todo_datasource.dart';
import '../../infra/mappers/todo_mapper.dart';

class GetTodoDatasourceImpl implements GetTodoDatasource {
  const GetTodoDatasourceImpl(this._localStorageService);
  final LocalStorageService _localStorageService;

  static const _table = 'todos';

  @override
  Future<Set<TodoEntity>> getAllByUserID(GetAllByUserIDParam param) async {
    final getParam = GetFilteredLocalStorageParam(
      table: _table,
      filter: FilterItemLocalStorage(key: 'user_id', value: param.userID),
    );
    final response = await _localStorageService.getFiltered(getParam);

    final todos = TodoMapper.fromListMap(response).toSet();
    return todos;
  }
}
