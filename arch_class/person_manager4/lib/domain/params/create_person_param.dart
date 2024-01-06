import '../entities/address_entity.dart';

class CreatePersonParam {
  final String name;
  final String cpf;
  final DateTime birthAt;
  final String email;
  final String phone;
  final AddressEntity address;

  const CreatePersonParam({
    required this.name,
    required this.cpf,
    required this.birthAt,
    required this.email,
    required this.phone,
    required this.address,
  });
}
