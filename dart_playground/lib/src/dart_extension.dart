void dartExtension() {
  final name = 'Daniel Fernandes';
  print(name.toSnakeCase());
  // print(StringUtils.toSnakeCase(name));

  final name2 = 'daniel Fernandes';
  print(name2.capitalize());
}

extension SnakeCase on String {
  String toSnakeCase() {
    return toLowerCase().replaceAll(' ', '_');
  }

  String capitalize() {
    final firstLetter = this[0].toUpperCase();
    final rest = substring(1);
    return '$firstLetter$rest';
  }
}

// extension on String {
//   String capitalize() {
//     final firstLetter = this[0].toUpperCase();
//     final rest = substring(1);
//     return '$firstLetter$rest';
//   }
// }

class StringUtils {
  static String toSnakeCase(String value) {
    return value.toLowerCase().replaceAll(' ', '_');
  }
}
