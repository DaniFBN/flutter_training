import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/di/helpers.dart';
import 'package:modular_example/app/core/shared/log.dart';

class ObserveDI {
  static int? lastFactory;
  static int? lastSingleton;
  static int? lastLazySingleton;
  static int? lastInstance;
  static int? lastAsync;

  ObserveDI._();

  static void observe() async {
    final lastFactory = Modular.get<FactoryDI>().hashCode;
    _compareAndPrint('Factory', ObserveDI.lastFactory ?? 0, lastFactory);
    ObserveDI.lastFactory = lastFactory;

    final lastSingleton = Modular.get<SingletonDI>().hashCode;
    _compareAndPrint('Singleton', ObserveDI.lastSingleton ?? 0, lastSingleton);
    ObserveDI.lastSingleton = lastSingleton;

    final lastLazySingleton = Modular.get<LazySingletonDI>().hashCode;
    _compareAndPrint(
        'LazySingleton', ObserveDI.lastLazySingleton ?? 0, lastLazySingleton);
    ObserveDI.lastLazySingleton = lastLazySingleton;

    final lastInstance = Modular.get<InstanceDI>().hashCode;
    _compareAndPrint('Instance', ObserveDI.lastInstance ?? 0, lastInstance);
    ObserveDI.lastInstance = lastInstance;
  }

  static void _compareAndPrint(String type, int oldValue, int newValue) {
    if (oldValue == 0) {
      return OxLog.warning('$type was created');
    }
    if (oldValue == newValue) {
      OxLog.success('$type is equal');
    } else {
      OxLog.error('$type is not equal');
    }
  }
}
