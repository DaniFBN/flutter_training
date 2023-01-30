import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/di/helpers.dart';

final _instance = InstanceDI();

class DiModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => FactoryDI(), export: true),
    Bind.singleton((i) => SingletonDI(), export: true),
    Bind.lazySingleton((i) => LazySingletonDI(), export: true),
    Bind.instance<InstanceDI>(_instance, export: true),
    AsyncBind((i) async => AsyncDI(), export: true),
  ];
}

// Momento de criação
//   Instance = com o projeto
//   Singleton = Quando o modulo for inicializado
//   LazySingleton = Quando for chamado
//   Factory = Quando for chamado

// Lógica do Modular.get
//   Instance = Sempre a mesma instancia
//   Singleton = Sempre a mesma instancia
//   LazySingleton = Sempre a mesma instancia
//   Factory = Sempre uma nova instancia


