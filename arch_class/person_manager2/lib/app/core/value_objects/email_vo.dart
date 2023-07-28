import '_value_object.dart';

final class EmailVO extends ValueObject<String> {
  EmailVO(super.value);

  @override
  void validate() {
    if (!value.contains('@')) setError('Email inválido');
  }
}
