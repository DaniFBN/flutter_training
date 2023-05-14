import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_class/login.dart';
import 'package:test_class/repositories/auth_repository.dart';
import 'package:test_class/utils/exceptions.dart';

class RepositoryMock extends Mock implements IAuthRepository {}

class ParamFake extends Fake implements LoginParam {}

void main() {
  late Login login;
  late IAuthRepository repository;

  // final IAuthRepository repository = RepositoryMock();
  // final Login login = Login(repository);

  setUpAll(() {
    print('Inicio da main - setUpAll');
    registerFallbackValue(ParamFake());
  });

  setUp(() {
    repository = RepositoryMock();
    login = Login(repository);
    print('\nInicio de cada função teste - setUp');
  });

  tearDown(() {
    // reset(repository);
    print('Final de cada função teste - tearDown');
  });

  tearDownAll(() {
    print('\nApós rodar todos os testes - tearDownAll');
  });

  group('Login =>', () {
    group('Failure =>', () {
      test(
        'Deve retornar uma String quando o email não tiver @',
        () async {
          print('TESTE');
          // Arrange
          const email = 'whatever_test.com';
          const password = '123';

          // Act
          final result = await login.login(email: email, password: password);

          // Assert
          expect(result, isA<String>());
          expect(result, equals('Email inválido'));
          verifyNever(() => repository.login(email: email, password: password));
          verifyZeroInteractions(repository);
        },
      );

      test(
        'Deve retornar uma String quando a senha for menor que 8 caracteres',
        () async {
          print('TESTE');
          // Arrange
          const email = 'whatever@test.com';
          const password = '12';

          // Act'
          final result = await login.login(email: email, password: password);

          // Assert
          expect(result, isA<String>());
        },
      );

      test(
        'Deve retornar uma String quando tudo tiver certo nas validações mas repositório retornar uma String',
        () async {
          print('TESTE');

          // Arrange
          const email = 'whatever@test.com';
          const password = '123456789';
          when(() => repository.login(email: email, password: password))
              .thenAnswer((_) async => '');

          // Act
          final result = await login.login(email: email, password: password);

          // Assert
          expect(result, isA<String>());
        },
      );

      test(
        'Deve lançar um AppException quando o repositório lançar uma AppException',
        () async {
          print('TESTE');
          // Arrange
          const email = 'whatever@test.com';
          const password = '123456789';
          when(() => repository.login(email: email, password: password))
              .thenThrow(AppException(''));

          // Act
          final result = login.login(email: email, password: password);

          // Assert
          await expectLater(
            () async => await result,
            throwsA(isA<AppException>()),
          );

          expect(
            () async => await login.login(email: email, password: password),
            throwsA(isA<AppException>()),
          );
        },
      );
    });

    group('Success =>', () {
      test(
        'Deve retornar nulo quando tudo tiver certo nas validações e o repositório retornar nulo',
        () async {
          print('TESTE');

          // Arrange
          const email = 'whatever@test.com';
          const password = '123456789';
          // Quando
          // when(
          //         // Isso acontecer
          //         () => repository.login(email: email, password: password))
          //     .thenAnswer(
          //         // Entao responda
          //         // Isso daqui
          //         (_) async => null);
          when(() => repository.login(email: email, password: password))
              .thenAnswer((_) async => null);

          // Act
          final result = await login.login(email: email, password: password);

          // Assert
          expect(result, equals(null));

          verify(() => repository.login(email: email, password: password))
              .called(1);
        },
      );
    });

    group('Using Param =>', () {
      test(
        'Deve retornar nulo quando tudo tiver certo nas validações e o repositório retornar nulo',
        () async {
          print('TESTE');

          // Arrange
          const email = 'whatever@test.com';
          const password = '123456789';

          // Erro da falta de uso do `any()`
          // final param = LoginParam(email, password);
          // when(() => repository.loginParam(param))
          //     .thenAnswer((_) async => null);
          // print('MOCK ${param.hashCode}');

          when(() => repository.loginParam(any()))
              .thenAnswer((_) async => null);

          // Act
          final result = await login.loginParam(
            email: email,
            password: password,
          );

          // Assert
          expect(result, equals(null));

          verify(() => repository.loginParam(any())).called(1);
        },
      );

      test(
        'Deve retornar nulo quando tudo tiver certo nas validações e o repositório retornar nulo asasas',
        () async {
          print('TESTE');
          // Arrange
          const email = 'whatever@test.com';
          const password = '123456789';

          when(() => repository.loginParamNamed(param: any(named: 'param')))
              .thenAnswer((_) async => null);

          // Act
          final result = await login.loginParamNamed(
            email: email,
            password: password,
          );

          // Assert
          expect(result, equals(null));

          verify(() => repository.loginParamNamed(param: any(named: 'param')))
              .called(1);
          // verifyNever(() => repository.loginParam(param));
        },
      );
    });
  });
}


