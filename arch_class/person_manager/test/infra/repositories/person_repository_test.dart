import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager/core/failures/app_failure.dart';
import 'package:person_manager/domain/entities/person_entity.dart';
import 'package:person_manager/domain/params/create_person_param.dart';
import 'package:person_manager/domain/responses/create_person_response.dart';
import 'package:person_manager/infra/datasources/person_datasource.dart';
import 'package:person_manager/infra/mappers/person_mapper.dart';
import 'package:person_manager/infra/repositories/person_repository.dart';

import '../../core/failures/mocks.dart';

class DatasourceMock extends Mock implements IPersonDatasource {}

void main() {
  final datasource = DatasourceMock();
  final sut = PersonRepository(datasource);
  final param = CreatePersonParam(
    name: '',
    cpf: '',
    birthAt: DateTime.now(),
    sexo: Sexo.masculino,
  );
  final paramMap = PersonMapper.createParamToMap(param);

  tearDown(() => reset(datasource));

  test(
    'Deve retornar um CreatePersonResponse quando o datasource der certo',
    () async {
      when(() => datasource.create(paramMap))
          .thenAnswer((_) async => const CreatePersonResponse(1));

      final result = await sut.create(param);
      expect(result, isA<CreatePersonResponse>());
      verify(() => datasource.create(paramMap)).called(1);
    },
  );

  test(
    'Deve relançar um AppFailure quando o datasource der errado',
    () async {
      when(() => datasource.create(paramMap)).thenThrow(AppFailureMock());

      expect(
        () => sut.create(param),
        throwsA(isA<AppFailure>()),
      );
      verify(() => datasource.create(paramMap)).called(1);
    },
  );
}
