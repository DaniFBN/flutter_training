// Pré Dart 3

// abstract mixin

class Class {}

abstract class AbsClass {}

mixin Mixin {}
mixin Mixin2 {}

// Pós Dart 3

// interface, final, base, sealed

sealed class Pessoa {}

class Juridica extends Pessoa with Mixin, Mixin2 {}

class Fisica extends Pessoa {}

class Estrangeira extends Pessoa {}

enum PessoaEnum { juridica, fisica, estrangeira }

void main() {
  final pessoaEnum = PessoaEnum.fisica;

  switch (pessoaEnum) {
    case PessoaEnum.juridica:
      print('juridica');
    case PessoaEnum.fisica:
      print('fisica');
    case PessoaEnum.estrangeira:
      print('estrangeira');
  }

  final Pessoa pessoaClass = Juridica();

  switch (pessoaClass) {
    case Juridica():
      print('juridica');
    case Fisica():
      print('fisica');
    case Estrangeira():
      print('estrangeira');
  }
}

class UserState {}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {}
