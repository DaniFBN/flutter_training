import 'package:flutter_modular/flutter_modular.dart';

class ThemeModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => const ThemeBind(), export: true),
  ];
}

class ThemeBind {
  const ThemeBind();
}
