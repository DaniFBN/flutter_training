import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/di/helpers.dart';

final _instance = InstanceDI();

class DiModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(FactoryDI.new);
    i.addSingleton(SingletonDI.new);
    i.addLazySingleton(LazySingletonDI.new);
    i.addInstance(_instance);
  }
}

// Momento de criação
//   Instance = com o projeto
//   Singleton = Quando o modulo for inicializado
//   LazySingleton = Quando for chamado
//   Factory = Quando for chamado

// Lógica do Modular.get/Recuperação
//   Instance = Sempre a mesma instancia
//   Singleton = Sempre a mesma instancia
//   LazySingleton = Sempre a mesma instancia
//   Factory = Sempre uma nova instancia
