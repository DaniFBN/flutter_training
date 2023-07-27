import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager/app/core/failures/app_failure.dart';
import 'package:person_manager/app/core/services/local_storage/helpers/params.dart';
import 'package:person_manager/app/core/services/local_storage/helpers/responses.dart';
import 'package:person_manager/app/core/services/local_storage/local_storage_service.dart';
import 'package:person_manager/app/modules/person/domain/responses/create_person_response.dart';
import 'package:person_manager/app/modules/person/external/person_datasource.dart';

import '../core/failures/mocks.dart';

class ServiceMock extends Mock implements ILocalStorageService {}

class ParamFake extends Fake implements WriteLocalStorageParam {}

void main() {
  final service = ServiceMock();
  final sut = PersonDatasource(service);

  tearDown(() => reset(service));

  setUpAll(() {
    registerFallbackValue(ParamFake());
  });

  test(
    'Deve retornar um CreatePersonResponse quando o service der certo',
    () async {
      const id = 1;
      when(() => service.write(any()))
          .thenAnswer((_) async => const WriteLocalStorageResponse(id));

      final result = await sut.create({});
      expect(result, isA<CreatePersonResponse>());
      expect(result.id, equals(id));
      verify(() => service.write(any())).called(1);
    },
  );

  test(
    'Deve relançar um AppFailure quando o service der errado',
    () async {
      when(() => service.write(any())).thenThrow(AppFailureMock());

      expect(() => sut.create({}), throwsA(isA<AppFailure>()));
      verify(() => service.write(any())).called(1);
    },
  );
}
