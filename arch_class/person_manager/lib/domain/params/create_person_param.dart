

import '../entities/person_entity.dart';

class CreatePersonParam {
  final String name;
  final String cpf;
  final DateTime birthAt;
  final Sexo sexo;
  final String? telephone;

  const CreatePersonParam({
    required this.name,
    required this.cpf,
    required this.birthAt,
    required this.sexo,
    this.telephone,
  });
}
