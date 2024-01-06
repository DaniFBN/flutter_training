import 'package:person_manager3/app/core/value_objects/email_vo.dart';

class CreatePersonParam {
  final String name;
  final DateTime birthAt;
  final String cpf;
  final EmailVO? email;

  const CreatePersonParam({
    required this.name,
    required this.birthAt,
    required this.cpf,
    this.email,
  });
}
