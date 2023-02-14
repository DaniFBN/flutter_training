class NameType {
  final String value;

  const NameType(this.value);

  String? validate() {
    // if (EmptySpecification.validate(value)) {
    if (value.trim().isEmpty) {
      return 'Nome obrigatório';
    }

    if (!value.trim().contains(' ')) {
      return 'Insira seu nome completo';
    }

    return null;
  }
}

// class EmptySpecification {
//   static bool validate(String value) {
//     if (value.isEmpty) {
//       return false;
//     }

//     return true;
//   }
// }
