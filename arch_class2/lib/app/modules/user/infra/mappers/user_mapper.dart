import '../../domain/entities/user_entity.dart';
import '../../domain/helpers/exceptions.dart';
import '../../domain/helpers/params.dart';
import '../../domain/value_objects/name_type.dart';
import 'address_mapper.dart';

class UserMapper {
  const UserMapper._();

  static Map<String, dynamic> toMap(UserEntity user) {
    return <String, dynamic>{
      'id': user.id,
      'name': user.name.value,
      'email': user.email,
      'password': user.password,
      'phone': user.phone,
      'cpf': user.cpf,
      'address': AddressMapper.toMap(user.address),
      'monthlyIncome': user.monthlyIncome,
    };
  }

  static Map<String, dynamic> createUserToMap(CreateUserParam param) {
    return <String, dynamic>{
      'name': param.name.value,
      'email': param.email,
      'password': param.password,
      'phone': param.phone,
      'cpf': param.cpf,
      'address': AddressMapper.createUserToMap(param),
      'monthlyIncome': param.monthlyIncome,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
    double? monthlyIncome;
    if (map['monthlyIncome'] != null) {
      double.parse(map['monthlyIncome']);
    }

    try {
      return UserEntity(
        id: map['id'],
        name: NameType(map['name']),
        email: map['email'],
        password: map['password'],
        phone: map['phone'],
        cpf: map['cpf'],
        address: AddressMapper.fromMap(
          Map<String, dynamic>.from(map['address']),
        ),
        monthlyIncome: monthlyIncome,
      );
    } on MapperException {
      rethrow;
    } catch (e, stackTrace) {
      throw MapperException('UserMapper - $e', stackTrace: stackTrace);
    }
  }

  static Iterable<UserEntity> fromListMap(List<Map<String, dynamic>> data) {
    return data.map(fromMap);
  }
}
