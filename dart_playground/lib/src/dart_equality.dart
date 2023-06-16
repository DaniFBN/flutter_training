// ignore_for_file: public_member_api_docs, sort_constructors_first
void dartEquality() {
  const equality1 = Equality(23);
  const equality2 = Equality(23);

  print(equality1 == equality2);

  final equality3 = EqualityWithoutConst(23, 42);
  final equality4 = EqualityWithoutConst(23, 42);

  print(equality3.hashCode);
  print(equality4.hashCode);

  print(equality3 == equality4);
  print(equality3 + equality4);
}

class Equality {
  final int value;

  const Equality(this.value);
}

class EqualityWithoutConst {
  int value;
  final int value2;

  EqualityWithoutConst(
    this.value,
    this.value2,
  );

  @override
  bool operator ==(covariant EqualityWithoutConst other) {
    if (identical(this, other)) return true;

    return other.value == value || other.value2 == value2;
  }

  @override
  int get hashCode => value.hashCode ^ value2.hashCode;

  EqualityWithoutConst operator +(covariant EqualityWithoutConst other) {
    return EqualityWithoutConst(value + other.value, value2);
  }

  @override
  String toString() => 'EqualityWithoutConst(value: $value, value2: $value2)';
}
