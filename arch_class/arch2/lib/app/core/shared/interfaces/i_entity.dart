// Generics para caso o id possa ser `int` ou `String`
import 'package:flutter/cupertino.dart';

@immutable
class Entity<T> {
  final T id;

  const Entity({required this.id});

  @override
  bool operator ==(covariant Entity<T> other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
