import '../../../../core/value_objects/email_vo.dart';

class CreatePersonParam {
  final String name;
  final String cpf;
  final DateTime birth;
  final EmailVO? email;

  const CreatePersonParam({
    required this.name,
    required this.cpf,
    required this.birth,
    this.email,
  });
}
