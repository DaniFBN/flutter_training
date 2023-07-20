import 'package:person_manager/domain/params/create_person_param.dart';

import '../../core/failures/validation_failure.dart';
import '../repositories/person_repository.dart';
import '../responses/create_person_response.dart';

// Command Pattern
abstract interface class ICreatePersonUsecase {
  Future<CreatePersonResponse> call(CreatePersonParam param);
}

class CreatePersonUsecase implements ICreatePersonUsecase {
  final IPersonRepository _repository;

  const CreatePersonUsecase(this._repository);

  @override
  Future<CreatePersonResponse> call(CreatePersonParam param) async {
    final regex = RegExp(r'^[a-zA-Z]+( [a-zA-Z]+)+$');
    final handledName = param.name.trim();
    if (!regex.hasMatch(handledName)) {
      throw ValidationFailure('Deve ter nome e sobrenome');
    }

    final handledCpf = param.cpf.trim().replaceAll(RegExp('[.-]'), '');
    if (handledCpf.length != 11) {
      throw ValidationFailure('CPF inválido');
    }

    final now = DateTime.now();
    final eighteenYearsAgo = now.copyWith(year: now.year - 18);
    if (param.birthAt.isAfter(eighteenYearsAgo)) {
      throw ValidationFailure('Deve ser maior de 18 anos');
    }

    if (param.telephone?.length != 11) {
      throw ValidationFailure('Telefone inválido');
    }

    return _repository.create(param);
  }
}

