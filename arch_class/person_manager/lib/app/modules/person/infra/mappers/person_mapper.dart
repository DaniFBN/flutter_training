import 'package:person_manager/app/modules/person/domain/params/create_person_param.dart';

import '../../domain/entities/person_entity.dart';

abstract final class PersonMapper {
  static Map<String, dynamic> createParamToMap(CreatePersonParam param) {
    return {
      'name': param.name,
      'cpf': param.cpf,
      'sexo': param.sexo.name,
      'birth_at': param.birthAt.millisecondsSinceEpoch,
      'telephone': param.telephone,
    };
  }

  static List<PersonEntity> fromListMap(List<Map<String, dynamic>> data) {
    return data.map(PersonMapper.fromMap).toList();
  }

  static PersonEntity fromMap(Map<String, dynamic> data) {
    return PersonEntity(
      birthAt: DateTime.fromMillisecondsSinceEpoch(data['birth_at']),
      cpf: data['cpf'],
      id: data['id'],
      name: data['name'],
      telephone: data['telephone'],
      sexo: Sexo.values.byName(data['sexo']),
    );
  }
}
