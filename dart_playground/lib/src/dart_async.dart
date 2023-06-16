// await > Faz esperar o codigo assincrono - Não vai para a linha seguinte
// (Sem await) > A linha a seguir roda, sem esperar a resolução do código assincrono
// async > necessario para ter o await
// Future > Boa pratica para fazer que o metodo é assincrono - Ta mais pra obrigação
//

Future<void> dartAsync() async {
  print('init');
  // await Future.delayed(Duration(seconds: 4));

  request(1).then(whatever);

  final response = await request(1);
  whatever(response);

  await request(2);
  await request(3);
  await request(4);

  final init = DateTime.now();
  await Future.wait([
    request(10),
    request(11),
    request(12),
  ]);
  final end = DateTime.now();
  print(end.difference(init).inMilliseconds);

  request(20).then((_) {
    print('terminou o 20');
  });

  print('end');
}

int whatever(int value) {
  return value;
}

Future<int> request(int i) async {
  await Future.delayed(Duration(seconds: 1));
  print('end request $i');

  return i;
}

// void a() {
//   await Requisição1 -> 3 -> 7
//   await Requisição2 -> 8 -> 12
// }

// Flutter
//   rebuild -> 1
//   rebuild -> 2
//   rebuild -> 4
//   rebuild -> 5
//   rebuild -> 6
//   rebuild -> 9
//   rebuild -> 10
//   rebuild -> 11
//   rebuild -> 13
