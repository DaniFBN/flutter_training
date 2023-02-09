import 'package:flutter/foundation.dart';

@immutable
abstract class MyState {
  const MyState();
}

class MyLoadingState extends MyState {
  const MyLoadingState();
}

class MyErrorState extends MyState {
  final String? error;
  const MyErrorState(this.error);
}

class MySuccessState extends MyState {
  final List<String> products;
  const MySuccessState(this.products);
}

const MyState state = MySuccessState([]);
