class PersonEntity {
  final String id;
  final String name;
  final String cpf;
  final DateTime birth;
  final String? email;

  const PersonEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.birth,
    this.email,
  });
}
