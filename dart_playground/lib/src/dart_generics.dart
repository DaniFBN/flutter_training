void dartGenerics() {
  final class1 = GenericClass<int>(9);
  final class2 = GenericClass<String>('');

  final class3 = GenericNumClass<int, String>(2, '');
  final class4 = GenericNumClass<double, bool>(7.7, true);
}

class GenericClass<T> {
  final T value;

  const GenericClass(this.value);
}

class GenericNumClass<T extends num, R> {
  final T value;
  final R value2;

  const GenericNumClass(this.value, this.value2);
}

abstract class DefaultFormModel {
  Map<String, dynamic> toMap();
}

class UserFormModel extends DefaultFormModel {
  @override
  Map<String, dynamic> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}

abstract class ControllerForm<T extends DefaultFormModel> {
  T save();

  void _save() {
    final model = save();
    // request(model.toMap());
  }
}

class ControllerForm2 extends ControllerForm<UserFormModel> {
  @override
  UserFormModel save() {
    return UserFormModel();
  }
}
