import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager2/app/core/exceptions/app_exception.dart';
import 'package:person_manager2/app/core/exceptions/validation_exception.dart';
import 'package:person_manager2/app/domain/entities/person_entity.dart';
import 'package:person_manager2/app/domain/params/create_person_param.dart';
import 'package:person_manager2/app/domain/repositories/person_repository.dart';
import 'package:person_manager2/app/domain/usecases/create_person_usecase.dart';

import '../../core/exceptions/mocks/mocks.dart';
import '../mocks/mocks.dart';

// Entre cada teste - Cria - setUp
// Entre cada teste - Reseta - tearDown

void main() {
  final IPersonRepository repo = PersonRepositoryMock();
  final CreatePersonUsecase sut = CreatePersonUsecase(repo);
  final successParam = CreatePersonParam(
    name: 'Daniel Fernandes',
    cpf: '12312312312',
    birth: DateTime.now().subtract(const Duration(days: 30000)),
  );

  tearDown(() {
    reset(repo);
  });

  group(
    'CreatePersonUsecase |',
    () {
      group('Success |', () {
        test(
          'Deve retornar uma PersonEntity quando todos os dados forem válidos e o Repository der certo',
          () async {
            // Arrange
            when(() => repo.create(successParam))
                .thenAnswer((_) async => PersonEntityMock());

            // Act
            final result = await sut(successParam);

            // Assert
            expect(result, isA<PersonEntity>());
            expect(result.name, equals('')); // Exemplo didático
            verify(() => repo.create(successParam)).called(1);
          },
        );
      });
      group('Failure |', () {
        test(
          'Deve relançar uma AppException quando o repository lançar uma AppException',
          () async {
            // Arrange
            when(() => repo.create(successParam)).thenThrow(AppExceptionMock());

            // Assert
            expect(() => sut(successParam), throwsA(isA<AppException>()));
            verify(() => repo.create(successParam)).called(1);
          },
        );

        test(
          'Deve lançar uma ValidationException quando o nome tiver caractere especial',
          () async {
            final param = CreatePersonParam(
              name: 'Daniel @',
              cpf: '12312312312',
              birth: DateTime.now().subtract(const Duration(days: 30000)),
            );

            // try {
            //   await sut(param);
            // } on ValidationException catch (e) {
            //   expect(
            //     e.message,
            //     equals('O nome não deve ter caracteres especiais'),
            //   );
            // }

            expect(
              () => sut(param),
              throwsA(isA<ValidationException>()),
            );
            verifyZeroInteractions(repo);
          },
        );

        test(
          'Deve lançar uma ValidationException quando o tamanho do nome for menor do que 3',
          () {
            final param = CreatePersonParam(
              name: 'Da',
              cpf: '',
              birth: DateTime.now(),
            );

            expect(
              () => sut(param),
              throwsA(isA<ValidationException>()),
            );
            verifyZeroInteractions(repo);
          },
        );

        test(
          'Deve lançar uma ValidationException quando o tamanho do cpf for diferente de 11',
          () {
            final param = CreatePersonParam(
              name: 'Daniel ',
              cpf: '1212',
              birth: DateTime.now(),
            );

            expect(
              () => sut(param),
              throwsA(isA<ValidationException>()),
            );
            verifyZeroInteractions(repo);
          },
        );

        test(
          'Deve lançar uma ValidationException quando a idade baseada na data de nascimento for menor que 18 anos',
          () {
            final param = CreatePersonParam(
              name: 'Daniel ',
              cpf: '12312312312',
              birth: DateTime.now().subtract(const Duration(days: 4000)),
            );

            expect(
              () => sut(param),
              throwsA(isA<ValidationException>()),
            );
            verifyZeroInteractions(repo);
          },
        );

        test(
          'Deve lançar uma ValidationException quando receber um email e ele não conter um @',
          () {
            final param = CreatePersonParam(
              name: 'Daniel',
              cpf: '12312312312',
              birth: DateTime.now().subtract(const Duration(days: 40000)),
              email: '',
            );

            expect(
              () => sut(param),
              throwsA(isA<ValidationException>()),
            );
            verifyZeroInteractions(repo);
          },
        );
      });
    },
  );
}
