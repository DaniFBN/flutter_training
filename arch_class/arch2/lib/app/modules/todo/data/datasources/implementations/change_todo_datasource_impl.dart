import 'package:arch2/app/core/shared/services/local_storage/helpers/params.dart';
import 'package:arch2/app/modules/todo/data/datasources/interfaces/change_todo_datasource.dart';
import 'package:arch2/app/modules/todo/domain/entities/todo_entity.dart';
import 'package:arch2/app/modules/todo/domain/params/create_todo_param.dart';

import '../../../../../core/shared/services/local_storage/local_storage_service.dart';
import '../../mappers/todo_mapper.dart';

class ChangeTodoDatasourceImpl implements ChangeTodoDatasource {
  final LocalStorageService _localStorageService;

  const ChangeTodoDatasourceImpl(this._localStorageService);

  static const _table = 'todos';

  @override
  Future<TodoEntity> createTodo(CreateTodoParam param) async {
    final Map<String, dynamic> data = TodoMapper.createParamToMap(param);

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
    final Map<String, dynamic> data = TodoMapper.toMap(todo);

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
