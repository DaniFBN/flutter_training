// ignore_for_file: prefer_function_declarations_over_variables

import 'dart_notifier.dart';

typedef JumentoMap = Map<String, Jumento>;
typedef DefaultMap = Map<String, dynamic>;
typedef AsyncVoidCallback = Future<void> Function();
typedef AsyncJumentoMap = Future<JumentoMap>;

class Jumento {}

void dartTypedef() {
  VoidCallback voidCallback1 = () {};
  void Function() voidCallback2 = () {};

  // final JumentoMap data1 = {'key': 0};
  final JumentoMap data2 = {'key': Jumento()};
}
