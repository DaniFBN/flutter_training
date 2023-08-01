import 'package:person_manager/app/core/failures/app_failure.dart';
import 'package:person_manager/app/modules/person/domain/params/create_person_param.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/failures/validation_failure.dart';
import '../repositories/person_repository.dart';
import '../responses/create_person_response.dart';

// Command Pattern
abstract interface class ICreatePersonUsecase {
  AsyncResult<CreatePersonResponse, AppFailure> call(CreatePersonParam param);
}

class CreatePersonUsecase implements ICreatePersonUsecase {
  final IPersonRepository _repository;

  const CreatePersonUsecase(this._repository);

  @override
  AsyncResult<CreatePersonResponse, AppFailure> call(
    CreatePersonParam param,
  ) async {
    final regex = RegExp(r'^[a-zA-Z]+( [a-zA-Z]+)+$');
    final handledName = param.name.trim();
    if (!regex.hasMatch(handledName)) {
      return Result.failure(ValidationFailure('Deve ter nome e sobrenome'));
    }

    final handledCpf = param.cpf.trim().replaceAll(RegExp('[.-]'), '');
    if (handledCpf.length != 11) {
      return Result.failure(ValidationFailure('CPF inválido'));
    }

    final now = DateTime.now();
    final eighteenYearsAgo = now.copyWith(year: now.year - 18);
    if (param.birthAt.isAfter(eighteenYearsAgo)) {
      return Result.failure(ValidationFailure('Deve ser maior de 18 anos'));
    }

    final telephone = param.telephone;
    if (telephone != null && telephone.length != 11) {
      return Result.failure(ValidationFailure('Telefone inválido'));
    }

    return _repository.create(param);
  }
}
