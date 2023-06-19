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

  final user1 = UserEntity(id: 1);
  final user2 = UserEntity(id: 1);
  final user3 = UserEntity(id: 2);

  final product1 = ProductEntity(id: 1);
  final product2 = ProductEntity(id: 1);

  print(user1 == user2); // true
  print(user1 == user3); // false
  print(user1 == product1); // false
  print(product2 == product1); // true
}

class Equality {
  final int value;

  const Equality(this.value);
}

class EqualityWithoutConst {
  final int value;
  final int value2;

  EqualityWithoutConst(
    this.value,
    this.value2,
  );

  EqualityWithoutConst operator +(covariant EqualityWithoutConst other) {
    return EqualityWithoutConst(value + other.value, value2);
  }

  @override
  String toString() => 'EqualityWithoutConst(value: $value, value2: $value2)';

  @override
  bool operator ==(covariant EqualityWithoutConst other) {
    if (identical(this, other)) return true;

    return other.value == value && other.value2 == value2;
  }

  @override
  int get hashCode => value.hashCode ^ value2.hashCode;
}

class UserEntity extends Entity {
  const UserEntity({required super.id});
}
class ProductEntity extends Entity {
  const ProductEntity({required super.id});
}

class Entity {
  final int id;

  const Entity({
    required this.id,
  });

  @override
  bool operator ==(covariant Entity other) {
    if (identical(this, other)) return true;

    return other.runtimeType.toString() == runtimeType.toString() &&
        other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
