import 'package:person_manager2/app/domain/entities/person_entity.dart';

import '../params/create_person_param.dart';
import '../repositories/person_repository.dart';

// Command Pattern
abstract interface class ICreatePersonUsecase {
  Future<PersonEntity> call(CreatePersonParam param);
}

class CreatePersonUsecase implements ICreatePersonUsecase {
  final IPersonRepository _repository;

  const CreatePersonUsecase(this._repository);

  @override
  Future<PersonEntity> call(CreatePersonParam param) async {
    // final messages = [];

    final regex = RegExp(r'[@#$%&*^!]');
    if (regex.hasMatch(param.name)) {
      // messages.add('O nome não deve ter caracteres especiais');
      throw Exception('O nome não deve ter caracteres especiais');
    }
    if (param.name.trim().length < 3) {
      throw Exception('O nome deve ter 3 letras');
    }

    final handledCpf = param.cpf.replaceAll(RegExp('[.-]'), '');
    if (handledCpf.length != 11) {
      throw Exception('O cpf deve ter 11 dígitos');
    }

    final now = DateTime.now();
    final eighteenYearsAgo = now.copyWith(year: now.year - 18);
    if (param.birth.isAfter(eighteenYearsAgo)) {
      throw Exception('Deve ser maior de 18 anos');
    }

    final email = param.email;
    if (email != null && !email.contains('@')) {
      throw Exception('O email é inválido');
    }

    // if (messages.isNotEmpty) {
    //   throw Exception(messages);
    // }

    return _repository.create(param);
  }
}


