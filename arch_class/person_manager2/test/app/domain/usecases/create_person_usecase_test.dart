import 'package:flutter_test/flutter_test.dart';
import 'package:person_manager2/app/domain/entities/person_entity.dart';
import 'package:person_manager2/app/domain/params/create_person_param.dart';
import 'package:person_manager2/app/domain/repositories/person_repository.dart';
import 'package:person_manager2/app/domain/usecases/create_person_usecase.dart';

class _Repo implements IPersonRepository {
  @override
  Future<PersonEntity> create(CreatePersonParam param) {
    throw UnimplementedError();
  }
}

void main() {
  group(
    'CreatePersonUsecase |',
    () {
      group('Success |', () {});
      group('Failure |', () {
        test(
          'Deve lançar uma Exception quando o nome tiver caractere especial',
          () {
            final sut = CreatePersonUsecase(_Repo());
            final param = CreatePersonParam(
              name: 'Daniel @',
              cpf: '',
              birth: DateTime.now(),
            );

            // try {
            //   await sut(param);
            // } on Exception catch (e) {
            //   expect(
            //     e.toString(),
            //     equals('Exception: O nome não deve ter caracteres especiais'),
            //   );
            // }

            expect(
              () => sut(param),
              throwsA(isA<Exception>()),
            );
          },
        );

        test(
          'Deve lançar uma Exception quando o tamanho do nome for menor do que 3',
          () {
            final sut = CreatePersonUsecase(_Repo());
            final param = CreatePersonParam(
              name: 'Da',
              cpf: '',
              birth: DateTime.now(),
            );

            expect(
              () => sut(param),
              throwsA(isA<Exception>()),
            );
          },
        );

        test(
          'Deve lançar uma Exception quando o tamanho do cpf for diferente de 11',
          () {
            final sut = CreatePersonUsecase(_Repo());
            final param = CreatePersonParam(
              name: 'Daniel ',
              cpf: '1212',
              birth: DateTime.now(),
            );

            expect(
              () => sut(param),
              throwsA(isA<Exception>()),
            );
          },
        );

        test(
          'Deve lançar uma Exception quando a idade baseada na data de nascimento for menor que 18 anos',
          () {
            final sut = CreatePersonUsecase(_Repo());
            final param = CreatePersonParam(
              name: 'Daniel ',
              cpf: '12312312312',
              birth: DateTime.now().subtract(const Duration(days: 4000)),
            );

            expect(
              () => sut(param),
              throwsA(isA<Exception>()),
            );
          },
        );

        test(
          'Deve lançar uma Exception quando receber um email e ele não conter um @',
          () {
            final sut = CreatePersonUsecase(_Repo());
            final param = CreatePersonParam(
              name: 'Daniel',
              cpf: '12312312312',
              birth: DateTime.now().subtract(const Duration(days: 4000)),
              email: '',
            );

            expect(
              () => sut(param),
              throwsA(isA<Exception>()),
            );
          },
        );
      });
    },
  );
}
