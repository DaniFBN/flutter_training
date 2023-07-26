class CreatePersonParam {
  final String name;
  final String cpf;
  final DateTime birth;
  final String? email;

  const CreatePersonParam({
    required this.name,
    required this.cpf,
    required this.birth,
    this.email,
  });
}
