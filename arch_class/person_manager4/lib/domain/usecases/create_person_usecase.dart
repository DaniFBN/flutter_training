import '../entities/person_entity.dart';
import '../params/create_person_param.dart';
import '../repositories/i_person_repository.dart';

// Command Pattern
// O nome deve representar uma ação
// Deve ter 1 metodo publico
// É comum que o metodo se chame `call`
abstract class ICreatePersonUsecase {
  Future<PersonEntity> call(CreatePersonParam param);
}

class CreatePersonUsecase implements ICreatePersonUsecase {
  final IPersonRepository _repository;

  const CreatePersonUsecase(this._repository);

  @override
  Future<PersonEntity> call(CreatePersonParam param) {
    final handledName = param.name.trim();
    final nameRegex = RegExp('[0-9]');
    if (nameRegex.hasMatch(handledName) ||
        handledName.length <= 1 ||
        !handledName.contains(' ')) {
      throw Exception('Nome inválido');
    }

    if (!param.email.contains('@')) {
      throw Exception('Email inválido');
    }

    final handledCpf = param.cpf.trim().replaceAll('[.-]', '');
    final cpfRegex = RegExp(r'^[0-9]{11}$');
    if (!cpfRegex.hasMatch(handledCpf)) {
      throw Exception('CPF inválido');
    }

    final now = DateTime.now();
    final ago130Years = now.subtract(const Duration(days: 47450));
    if (param.birthAt.isBefore(ago130Years)) {
      throw Exception('Data de nascimento inválida. Maior de 130');
    }

    final handledPhone = param.phone.trim().replaceAll('[()- ]', '');
    final phoneRegex = RegExp(r'^[0-9]{11}$');
    if (!phoneRegex.hasMatch(handledPhone)) {
      throw Exception('Telefone inválido');
    }

    if (param.address.street.isEmpty ||
        param.address.city.isEmpty ||
        param.address.state.isEmpty ||
        param.address.number.isEmpty) {
      throw Exception('Endereço inválido');
    }

    return _repository.create(param);
  }
}


