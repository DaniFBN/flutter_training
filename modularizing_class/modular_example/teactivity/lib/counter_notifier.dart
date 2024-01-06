import 'dart:async';

import 'package:flutter/material.dart';

class CounterNotifier extends ValueNotifier<List<int>> {
  CounterNotifier() : super([]);

  void increment() {
    value = [...value, value.length];

    print(hashCode);
    print(value.hashCode);
  }
}

class CounterStream extends Cubit<int> {
  CounterStream() : super(0);

  void increment() {
    emit(state + 1);
  }
}

class Cubit<T> {
  final StreamController<T> _stream;
  late T _state;

  Cubit(T initialState) : _stream = StreamController<T>.broadcast(sync: true) {
    emit(initialState);
    _stream.add(initialState);
  }

  Stream<T> get stream => _stream.stream;
  T get state => _state;

  void emit(T newState) {
    _state = newState;
    _stream.add(newState);
  }
}
