enum Sexo { masculino, feminino }

class PersonEntity {
  final String name;
  final String cpf;
  final String telephone;
  final DateTime birthAt;
  final String color;
  final Sexo sexo;

  const PersonEntity({
    required this.name,
    required this.cpf,
    required this.birthAt,
    required this.color,
    required this.telephone,
    required this.sexo,
  });
}
