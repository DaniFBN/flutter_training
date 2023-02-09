class AddressEntity {
  final String id;
  final String street;
  final String neighborhood;
  final String city;
  final String state;
  final String zipCode;
  final String number;
  final String? complement;

  const AddressEntity({
    required this.id,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.number,
    this.complement,
  });
}
