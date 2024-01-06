import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';
import 'package:modular_example/app/core/menu/menu_page.dart';

class MenuModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => MenuPage(colorStore: Modular.get<ColorStore>()));
  }
}
