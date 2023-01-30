library contabil;

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class UserStorage {
  static const UserStorage instance = UserStorage._();

  const UserStorage._();
}

class Contabil {
  void main() {
    UserStorage.instance;
  }
}

class RH {
  void main() {
    UserStorage.instance;
  }
}

class Financeiro {
  void main() {
    UserStorage.instance;
  }
}