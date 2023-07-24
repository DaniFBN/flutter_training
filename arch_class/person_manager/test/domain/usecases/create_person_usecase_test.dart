import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager/core/failures/validation_failure.dart';
import 'package:person_manager/domain/entities/person_entity.dart';
import 'package:person_manager/domain/params/create_person_param.dart';
import 'package:person_manager/domain/repositories/person_repository.dart';
import 'package:person_manager/domain/responses/create_person_response.dart';
import 'package:person_manager/domain/usecases/create_person_usecase.dart';

class RepoMock extends Mock implements IPersonRepository {}

class ResponseMock extends Mock implements CreatePersonResponse {}

void main() {
  final repo = RepoMock();
  // Sut = System Under Test
  final sut = CreatePersonUsecase(repo);

  group(
    'CreatePersonUsecase | Success |',
    () {
      test(
        'Deve retornar um CreatePersonResponse quando o repository der certo',
        () async {
          // Arrange
          final param = CreatePersonParam(
            name: 'Daniel Fernandes',
            cpf: '12312312312',
            birthAt: DateTime.now().subtract(const Duration(days: 10000)),
            sexo: Sexo.feminino,
            telephone: '12121212121',
          );
          when(() => repo.create(param))
              .thenAnswer((_) async => const CreatePersonResponse(1));

          // Act
          final result = await sut(param);

          // Assert
          expect(result, isA<CreatePersonResponse>());
        },
      );
    },
  );
  group('CreatePersonUsecase | Failure |', () {
    test(
      'Deve lançar uma ValidationFailure quando o nome não conter um sobrenome',
      () async {
        // Arrange
        final param = CreatePersonParam(
          name: 'Daniel',
          cpf: '12312312312',
          birthAt: DateTime.now().subtract(const Duration(days: 10000)),
          sexo: Sexo.feminino,
          telephone: null,
        );

        // Assert
        expect(
          () => sut(param),
          throwsA(isA<ValidationFailure>()),
        );
      },
    );

    test(
      'Deve lançar uma ValidationFailure quando o nome tiver caracteres especiais e/ou números',
      () async {
        // Arrange
        final param = CreatePersonParam(
          name: 'Daniel Fernandes1',
          cpf: '12312312312',
          birthAt: DateTime.now().subtract(const Duration(days: 10000)),
          sexo: Sexo.feminino,
          telephone: null,
        );

        // Assert
        expect(
          () => sut(param),
          throwsA(isA<ValidationFailure>()),
        );
      },
    );

    test(
      'Deve lançar uma ValidationFailure quando o tamanho do cpf for diferente de 11',
      () async {
        // Arrange
        final param = CreatePersonParam(
          name: 'Daniel Fernandes',
          cpf: '1231231231',
          birthAt: DateTime.now().subtract(const Duration(days: 10000)),
          sexo: Sexo.feminino,
          telephone: null,
        );

        // Assert
        expect(
          () => sut(param),
          throwsA(isA<ValidationFailure>()),
        );
      },
    );

    test(
      'Deve lançar uma ValidationFailure quando a idade for menor de 18 anos',
      () async {
        // Arrange
        final param = CreatePersonParam(
          name: 'Daniel Fernandes',
          cpf: '12312312312',
          birthAt: DateTime.now(),
          sexo: Sexo.feminino,
          telephone: null,
        );

        // Assert
        expect(
          () => sut(param),
          throwsA(isA<ValidationFailure>()),
        );
      },
    );

    test(
      'Deve lançar uma ValidationFailure quando o telephone passado não tiver 11 dígitos',
      () async {
        // Arrange
        final param = CreatePersonParam(
          name: 'Daniel Fernandes',
          cpf: '12312312312',
          birthAt: DateTime.now().subtract(const Duration(days: 10000)),
          sexo: Sexo.feminino,
          telephone: '12',
        );

        // Assert
        expect(
          () => sut(param),
          throwsA(isA<ValidationFailure>()),
        );
      },
    );
  });
}
