import 'package:person_manager2/app/core/exceptions/app_exception.dart';
import 'package:person_manager2/app/modules/person/domain/entities/person_entity.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/validation_exception.dart';
import '../params/create_person_param.dart';
import '../repositories/person_repository.dart';

// Command Pattern
abstract interface class ICreatePersonUsecase {
  AsyncResult<PersonEntity, AppException> call(CreatePersonParam param);
}

class CreatePersonUsecase implements ICreatePersonUsecase {
  final IPersonRepository _repository;

  const CreatePersonUsecase(this._repository);

  @override
  AsyncResult<PersonEntity, AppException> call(CreatePersonParam param) async {
    // final messages = [];

    final regex = RegExp(r'[@#$%&*^!]');
    if (regex.hasMatch(param.name)) {
      // messages.add('O nome não deve ter caracteres especiais');
      return ValidationException(
        'O nome não deve ter caracteres especiais',
      ).toFailure();
    } else if (param.name.trim().length < 3) {
      return ValidationException('O nome deve ter 3 letras').toFailure();
    }

    final handledCpf = param.cpf.replaceAll(RegExp('[.-]'), '');
    if (handledCpf.length != 11) {
      return ValidationException('O cpf deve ter 11 dígitos').toFailure();
    }

    final now = DateTime.now();
    final eighteenYearsAgo = now.copyWith(year: now.year - 18);
    if (param.birth.isAfter(eighteenYearsAgo)) {
      return ValidationException('Deve ser maior de 18 anos').toFailure();
    }

    final email = param.email;
    if (email != null && !email.contains('@')) {
      return ValidationException('O email é inválido').toFailure();
    }

    // if (messages.isNotEmpty) {
    //   throw Exception(messages);
    // }

    return _repository.create(param);
  }
}



// AsyncResult<Success, Failure> - async
// AsyncResult<Entity, AppException> - async
//   Type - Result
//     Type.toSuccess()
//     Type.toFailure()

//     Result.success(Type)
//     Result.failure(Type)

