
import '../value_objects/name_type.dart';

class CreateUserParam {
  final NameType name;
  final String email;
  final String password;
  final String phone;
  final String cpf;
  final double? monthlyIncome;
  final String street;
  final String neighborhood;
  final String city;
  final String state;
  final String zipCode;
  final String number;
  final String? complement;

  const CreateUserParam({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.cpf,
    this.monthlyIncome,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.number,
    this.complement,
  });
}
