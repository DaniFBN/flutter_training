import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => const UserBind(), export: true),
  ];
}

class UserBind {
  const UserBind();
}
