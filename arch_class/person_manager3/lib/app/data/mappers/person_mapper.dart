import 'package:person_manager3/app/core/value_objects/email_vo.dart';
import 'package:person_manager3/app/domain/entities/person_entity.dart';
import 'package:person_manager3/app/domain/params/create_person_param.dart';

class PersonMapper {
  static PersonEntity fromMap(Map<String, dynamic> data) {
    return PersonEntity(
      id: data['id'],
      name: data['name'],
      birthAt: DateTime.fromMillisecondsSinceEpoch(data['birth_at']),
      cpf: data['cpf'],
      email: data['email'] == null ? null : EmailVO(data['email']),
    );
  }

  static Map<String, dynamic> createParamToMap(CreatePersonParam param) {
    return {
      'name': param.name,
      'email': param.email?.value,
      'cpf': param.cpf,
      'birth_at': param.birthAt.millisecondsSinceEpoch,
    };
  }
}
