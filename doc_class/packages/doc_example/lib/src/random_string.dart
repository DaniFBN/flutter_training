import 'dart:math';

///A function to generate a random [String] based on your params
///
///* [length] param determina o tamanho de dígitos gerados
///* [max] param determina qual será o maior número gerado, lembrando que começa
/// em 0 e termina em [max] -1
///* [separator] param é o separador na hora de juntar os números, o padrão é
///`''`
///
///Example:
///
///```dart
///final result = generateRandomString(length: 2, max: 2);
///print(result); // 01
///```
/// <br/>
///
///```dart
///final result = generateRandomString(length: 10, max: 10, separator: '-');
///print(result); // 2-3-7-6-9-1-6-1-2-7
///```
String generateRandomString({
  required int length,
  required int max,
  String separator = '',
}) {
  final random = Random();

  final numbers = [];
  for (var i = 0; i < length; i++) {
    numbers.add(random.nextInt(max));
  }

  final result = numbers.join(separator);
  return result;
}
