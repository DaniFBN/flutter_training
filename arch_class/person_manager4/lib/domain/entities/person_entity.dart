import 'package:person_manager4/domain/entities/address_entity.dart';

class PersonEntity {
  final int id;
  final String name;
  final String cpf;
  final DateTime birthAt;
  final String email;
  final String phone;
  final AddressEntity address;

  const PersonEntity({
    required this.id,
    required this.name,
    required this.cpf,
    required this.birthAt,
    required this.email,
    required this.phone,
    required this.address,
  });
}
