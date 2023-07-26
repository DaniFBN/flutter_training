import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager2/app/core/exceptions/app_exception.dart';
import 'package:person_manager2/app/core/exceptions/mapper_exception.dart';
import 'package:person_manager2/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager2/app/modules/person/domain/params/create_person_param.dart';
import 'package:person_manager2/app/modules/person/infra/datasources/person_datasource.dart';
import 'package:person_manager2/app/modules/person/infra/mappers/person_mapper.dart';
import 'package:person_manager2/app/modules/person/infra/repositories/person_repository.dart';

import '../../core/exceptions/mocks/mocks.dart';
import '../mocks/mocks.dart';

void main() {
  final IPersonDatasource datasource = PersonDatasourceMock();
  final sut = PersonRepository(datasource);
  final param = CreatePersonParam(
    name: '',
    cpf: '',
    birth: DateTime.now(),
  );
  final paramMap = PersonMapper.createParamToMap(param);

  tearDown(() => reset(datasource));

  group(
    'PersonRepository |',
    () {
      group(
        'Success |',
        () {
          test(
            'Deve retornar uma PersonEntity quando o datasource der certo',
            () async {
              final responseMock = {
                'id': '',
                'name': '',
                'email': '',
                'cpf': '',
                'birth': DateTime.now().millisecondsSinceEpoch,
              };
              when(() => datasource.create(paramMap))
                  .thenAnswer((_) async => responseMock);

              final result = await sut.create(param);

              expect(result, isA<PersonEntity>());
              verify(() => datasource.create(paramMap)).called(1);
            },
          );
        },
      );

      group(
        'Failure |',
        () {
          test(
            'Deve relançar uma AppException quando o Datasource lançar uma AppException',
            () async {
              when(() => datasource.create(paramMap))
                  .thenThrow(AppExceptionMock());

              expect(() => sut.create(param), throwsA(isA<AppException>()));
              verify(() => datasource.create(paramMap)).called(1);
            },
          );

          test(
            'Deve quebrar quando o valor que veio do Datasource for errado',
            () async {
              when(() => datasource.create(paramMap))
                  .thenAnswer((_) async => <String, dynamic>{});

              await expectLater(
                () async => await sut.create(param),
                throwsA(isA<MapperException>()),
              );
              verify(() => datasource.create(paramMap)).called(1);
            },
          );
        },
      );
    },
  );
}
