enum Sexo { masculino, feminino }

class PersonEntity {
  final int id;
  final String name;
  final String cpf;
  final DateTime birthAt;
  final Sexo sexo;
  final String? telephone;

  const PersonEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.birthAt,
    required this.sexo,
    this.telephone,
  });
}
