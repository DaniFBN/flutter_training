void dartRepeating() {
  var while1 = 0;
  while (while1 < 10) {
    print('While - $while1');
    while1++;
  }

  var while2 = 0;
  do {
    print('Do while - $while2');
    while2++;
  } while (while2 < 10);

  for (var i = 0; i < 10; i++) {
    print('For Raiz - $i');
  }

  final data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  for (final value in data) {
    print('ForIn - $value');
  }

  // ignore: avoid_function_literals_in_foreach_calls
  data.forEach((e) {
    print('ForEach - $e');
  });

  final map = {'name': 'Daniel', 'age': 23};
  for (final key in map.keys) {
    final data = map[key];
    print('$key - $data');
  }

  for (final entry in map.entries) {
    print('${entry.key} - ${entry.value}');
  }

  for (final MapEntry(:key, :value) in map.entries) {
    print('$key - $value');
  }

  for (final value in map.values) {
    print('$value');
  }
}
