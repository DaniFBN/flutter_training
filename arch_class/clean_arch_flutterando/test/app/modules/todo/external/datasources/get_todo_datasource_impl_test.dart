import 'package:clean_arch_flutterando/app/core/shared/services/local_storage/helpers/params.dart';
import 'package:clean_arch_flutterando/app/core/shared/services/local_storage/helpers/responses.dart';
import 'package:clean_arch_flutterando/app/core/shared/services/local_storage/local_storage_service.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/entities/entities.dart';
import 'package:clean_arch_flutterando/app/modules/todo/domain/params/create_todo_param.dart';
import 'package:clean_arch_flutterando/app/modules/todo/external/datasources/datasources.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ServiceMock extends Mock implements LocalStorageService {}
class ParamFake extends Fake implements CreateLocalStorageParam {}

void main() {

  setUpAll(() {
    registerFallbackValue(ParamFake());
  });
  
  test('get todo datasource impl ...', () async {
    final service = ServiceMock();
    final sut = ChangeTodoDatasourceImpl(service);

    when(() => service.create(any())).thenAnswer(
      (_) async => const CreateLocalStorageResponse(
        {
          'id': '',
          'name': '',
          'user_id': '',
          'description': '',
          'created_at': 20000,
        },
      ),
    );

    const param = CreateTodoParam(
      userID: '',
      name: '',
      description: '',
    );
    final result = await sut.createTodo(param);

    expect(result, isA<TodoEntity>());
  });
}
