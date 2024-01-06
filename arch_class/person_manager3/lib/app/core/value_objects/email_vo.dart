class EmailVO {
  final String value;
  late final String? error;
  bool get isValid => error == null;

  EmailVO(this.value) {
    error = validate(value);
  }

  static String? validate(String? value) {
    if (value != null && !value.contains('@')) {
      return 'Email inválido';
    }

    return null;
  }
}