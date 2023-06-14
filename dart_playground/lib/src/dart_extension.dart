void dartExtension() {
  final name = 'Daniel Fernandes';
  print(name.toSnakeCase());

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
