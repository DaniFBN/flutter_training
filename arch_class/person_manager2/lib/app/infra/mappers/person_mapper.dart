import 'package:person_manager2/app/core/exceptions/mapper_exception.dart';
import 'package:person_manager2/app/domain/params/create_person_param.dart';

import '../../domain/entities/person_entity.dart';

class PersonMapper {
  const PersonMapper._();

  static Map<String, dynamic> createParamToMap(CreatePersonParam param) {
    return {
      'name': param.name,
      'cpf': param.cpf,
      'birth': param.birth.millisecondsSinceEpoch,
      'email': param.email,
    };
  }

  static PersonEntity fromMap(Map<String, dynamic> map) {
    // Exemplo didático
    try {
      final birth = DateTime.fromMillisecondsSinceEpoch(map['birth']);

      return PersonEntity(
        id: map['id'],
        name: map['name'],
        cpf: map['cpf'],
        birth: birth,
        email: map['email'],
      );
    } catch (e) {
      if (e.runtimeType.toString() == '_TypeError') {
        throw MapperException('PersonMapper: Error no conversão');
      }

      rethrow;
    }
  }
}
