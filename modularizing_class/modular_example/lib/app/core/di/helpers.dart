import 'package:modular_example/app/core/shared/log.dart';

abstract class LogClass {
  LogClass() {
    OxLog.neutral(this);
  }

  @override
  String toString() {
    return '$runtimeType: $hashCode';
  }
}

class FactoryDI extends LogClass {}

class SingletonDI extends LogClass {}

class LazySingletonDI extends LogClass {}

class InstanceDI extends LogClass {}

class AsyncDI extends LogClass {}
