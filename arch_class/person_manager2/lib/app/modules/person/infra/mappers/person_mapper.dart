import 'package:person_manager2/app/core/exceptions/mapper_exception.dart';
import 'package:person_manager2/app/core/value_objects/email_vo.dart';
import 'package:person_manager2/app/modules/person/domain/params/create_person_param.dart';

import '../../domain/entities/person_entity.dart';

abstract final class PersonMapper {
  static Map<String, dynamic> createParamToMap(CreatePersonParam param) {
    return {
      'name': param.name,
      'cpf': param.cpf,
      'birth': param.birth.millisecondsSinceEpoch,
      'email': param.email?.value,
    };
  }

  static PersonEntity fromMap(Map<String, dynamic> map) {
    // Exemplo didático
    try {
      final birth = DateTime.fromMillisecondsSinceEpoch(map['birth']);
      EmailVO? email;
      if (map['email'] != null) {
        email = EmailVO(map['email']);
      }

      return PersonEntity(
        id: map['id'],
        name: map['name'],
        cpf: map['cpf'],
        birth: birth,
        email: email,
      );
    } catch (e) {
      if (e.runtimeType.toString() == '_TypeError') {
        throw MapperException('PersonMapper: Error no conversão');
      }

      rethrow;
    }
  }

  static Iterable<PersonEntity> fromListMap(List<Map<String, dynamic>> data) {
    return data.map(fromMap);
  }
}
