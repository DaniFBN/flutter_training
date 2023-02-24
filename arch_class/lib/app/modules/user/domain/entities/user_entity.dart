import '../value_objects/name_type.dart';
import 'address_entity.dart';

class UserEntity {
  final String id;
  final NameType name;
  final String email;
  final String password;
  final String phone;
  final String cpf;
  final AddressEntity address;
  final double? monthlyIncome;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.cpf,
    required this.address,
    this.monthlyIncome,
  });
}
