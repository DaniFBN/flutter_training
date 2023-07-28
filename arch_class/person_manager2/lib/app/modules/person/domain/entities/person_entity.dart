import 'package:person_manager2/app/core/value_objects/email_vo.dart';

class PersonEntity {
  final String id;
  final String name;
  final String cpf;
  final DateTime birth;
  final EmailVO? email;

  const PersonEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.birth,
    this.email,
  });
}
