import 'package:person_manager/domain/params/create_person_param.dart';

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
}
