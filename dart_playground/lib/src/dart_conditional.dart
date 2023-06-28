// ignore_for_file: curly_braces_in_flow_control_structures

void dartConditional() {
  if (true) {}

  if (true) {
  } else {}

  if (true) {
  } else if (true) {
  } else {}

  if (true) print('xd');

  // Não recomendo pelos linters
  if (true)
    print('xd');
  else
    print('xd');

  final switchCase = SwitchCase.option1;
  switch (switchCase) {
    case SwitchCase.option1:
      print('option1');
      break;
    case SwitchCase.option2:
      print('option2');
      break;
    case SwitchCase.option3:
      print('option2');
      break;
  }

  // Dart 3
  final notaFinal = 8.2;
  switch (notaFinal) {
    case >= 0 && < 5:
      print('I');
    case >= 5 && < 7:
      print('R');
    case >= 7 && < 10:
      print('B');
    case 10:
      print('MB');
    default:
      print('Error');
  }

  final media = switch (notaFinal) {
    >= 0 && < 5 => 'I',
    >= 5 && < 7 => 'R',
    >= 7 && < 10 => 'B',
    10 => 'MB',
    _ => 'Error',
  };
  print(media);

  // final exception = switch (firebaseException.code) {
  //   'invalid-email' => AuthFailure('Email inválido'),
  //   'wrong-password' => AuthFailure('Senha inválida'),
  //   _ => AuthFailure('Error na autenticação'),
  // };
  // throw exception;
}

enum SwitchCase {
  option1,
  option2,
  option3;
}
