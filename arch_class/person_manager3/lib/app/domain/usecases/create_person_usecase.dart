import 'package:person_manager3/app/domain/entities/person_entity.dart';

import '../params/create_person_param.dart';
import '../repositories/person_repository.dart';

abstract interface class ICreatePersonUsecase {
  Future<PersonEntity> call(CreatePersonParam param);
}

class CreatePersonUsecase implements ICreatePersonUsecase {
  final IPersonRepository _repository;

  const CreatePersonUsecase(this._repository);

  @override
  Future<PersonEntity> call(CreatePersonParam param) {
    final email = param.email;
    if (email != null && !email.isValid) {
      throw Exception(email.error);
    }

    final now = DateTime.now();
    // final eighteenYearsAgo = now.subtract(const Duration(days: 6570));
    final eighteenYearsAgo = now.copyWith(year: now.year - 18);
    if (param.birthAt.isAfter(eighteenYearsAgo)) {
      throw Exception('Deve ter mais de 18 anos');
    }

    if (!param.name.contains(' ')) {
      throw Exception('Nome inválido');
    }

    if (!_validateCPF(param.cpf)) {
      throw Exception('CPF inválido');
    }

    return _repository.create(param);
  }

  bool _validateCPF(String cpf) {
    final handledCpf = cpf.replaceAll(RegExp('[.-]'), '');
    final splittedCpf = handledCpf.split('').map(int.parse).toList();


    final firstStepCpf = splittedCpf.getRange(0, 9);
    int multiplier = 10;
    int sumValue = 0;
    for (final digit in firstStepCpf) {
      sumValue += digit * multiplier;

      multiplier--;
    }

    int multiplierValue = sumValue * 10;
    int rest = multiplierValue % 11;
    if (rest == 10) rest = 0;

    if (rest != splittedCpf.elementAt(9)) return false;

    final secondStepCpf = splittedCpf.getRange(0, 10);
    multiplier = 11;
    sumValue = 0;
    for (final digit in secondStepCpf) {
      sumValue += digit * multiplier;

      multiplier--;
    }

    multiplierValue = sumValue * 10;
    rest = multiplierValue % 11;
    if (rest == 10) rest = 0;

    if (rest != splittedCpf.elementAt(10)) return false;

    return true;
  }
}
