import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_page.dart';
import 'package:modular_example/app/core/color/color_store.dart';

class ColorModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addSingleton(
      (i) => ColorStore(),
      config: BindConfig<ColorStore>(onDispose: (store) => store.dispose()),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/whatever', child: (_) => const ColorPage());
  }
}

// Module
//   binds -> Method
//   exportedBinds -> Method
//   imports -> Getter
//   routes -> Method
