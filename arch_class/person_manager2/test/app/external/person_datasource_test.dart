import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager2/app/core/exceptions/app_exception.dart';
import 'package:person_manager2/app/core/services/local_storage/i_local_storage_service.dart';
import 'package:person_manager2/app/modules/person/external/person_datasource.dart';

import '../core/exceptions/mocks/mocks.dart';
import '../core/services/mocks/mocks.dart';

void main() {
  final ILocalStorageService service = LocalStorageServiceMock();
  final sut = PersonDatasource(service);

  setUpAll(() {
    registerFallbackValue(WriteLocalStorageParamFake());
  });

  tearDown(() => reset(service));

  group('PersonDatasource |', () {
    group('Success |', () {
      test(
        'deve retornar um Map quando o Service funcionar corretamente',
        () async {
          when(() => service.write(any())).thenAnswer((_) async => {});

          final result = await sut.create({});

          expect(result, isA<Map<String, dynamic>>());
          verify(() => service.write(any())).called(1);
        },
      );
    });

    group('Failure |', () {
      test(
        'deve deixar passar um erro quando o Service lançar algo',
        () async {
          when(() => service.write(any())).thenThrow(AppExceptionMock());

          expect(() => sut.create({}), throwsA(isA<AppException>()));
          verify(() => service.write(any())).called(1);
        },
      );
    });
  });
}
