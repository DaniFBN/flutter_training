import '../../domain/entities/address_entity.dart';
import '../../domain/helpers/exceptions.dart';
import '../../domain/helpers/params.dart';

class AddressMapper {
  const AddressMapper._();

  static Map<String, dynamic> toMap(AddressEntity entity) {
    return <String, dynamic>{
      'id': entity.id,
      'street': entity.street,
      'neighborhood': entity.neighborhood,
      'city': entity.city,
      'state': entity.state,
      'zipCode': entity.zipCode,
      'number': entity.number,
      'complement': entity.complement,
    };
  }

  static Map<String, dynamic> createUserToMap(CreateUserParam param) {
    return <String, dynamic>{
      'street': param.street,
      'neighborhood': param.neighborhood,
      'city': param.city,
      'state': param.state,
      'zipCode': param.zipCode,
      'number': param.number,
      'complement': param.complement,
    };
  }

  static AddressEntity fromMap(Map<String, dynamic> map) {
    try {
      return AddressEntity(
        id: map['id'] as String,
        street: map['street'] as String,
        neighborhood: map['neighborhood'] as String,
        city: map['city'] as String,
        state: map['state'] as String,
        zipCode: map['zipCode'] as String,
        number: map['number'] as String,
        complement:
            map['complement'] != null ? map['complement'] as String : null,
      );
    } catch (e, stackTrace) {
      throw MapperException('AddressMapper - $e', stackTrace: stackTrace);
    }
  }
}
