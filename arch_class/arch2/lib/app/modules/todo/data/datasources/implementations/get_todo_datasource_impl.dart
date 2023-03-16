import 'package:arch2/app/core/shared/services/local_storage/helpers/params.dart';
import 'package:arch2/app/modules/todo/domain/entities/todo_entity.dart';
import 'package:arch2/app/modules/todo/domain/params/get_all_by_user_id_param.dart';

import '../../../../../core/shared/services/local_storage/local_storage_service.dart';
import '../../mappers/todo_mapper.dart';
import '../interfaces/get_todo_datasource.dart';

class GetTodoDatasourceImpl implements GetTodoDatasource {
  final LocalStorageService _localStorageService;

  const GetTodoDatasourceImpl(this._localStorageService);

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
