import '../../../../core/shared/services/local_storage/helpers/params.dart';
import '../../../../core/shared/services/local_storage/local_storage_service.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/params/create_todo_param.dart';
import '../../infra/datasources/change_todo_datasource.dart';
import '../../infra/mappers/todo_mapper.dart';

class ChangeTodoDatasourceImpl implements ChangeTodoDatasource {
  const ChangeTodoDatasourceImpl(this._localStorageService);

  final LocalStorageService _localStorageService;

  static const _table = 'todos';

  @override
  Future<TodoEntity> createTodo(CreateTodoParam param) async {
    final data = TodoMapper.createParamToMap(param);

    final paramStorage = CreateLocalStorageParam(
      table: _table,
      data: data,
    );
    final response = await _localStorageService.create(paramStorage);

    final todo = TodoMapper.fromMap(response.data);
    return todo;
  }

  @override
  Future<TodoEntity> update(TodoEntity todo) async {
    // final model = TodoModel(
    //   id: todo.id,
    //   name: todo.name,
    //   description: todo.description,
    //   createdAt: todo.createdAt,
    //   executedAt: todo.executedAt,
    // );
    // final Map<String, dynamic> data = model.toMap();
    // final Map<String, dynamic> data = TodoModel.entityToMap(todo);
    final data = TodoMapper.toMap(todo);

    final param = UpdateLocalStorageParam(
      table: _table,
      id: todo.id,
      data: data,
    );
    final response = await _localStorageService.update(param);

    final todoModel = TodoMapper.fromMap(response);
    return todoModel;
  }
}
