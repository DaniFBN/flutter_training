import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';
import 'package:modular_example/app/core/menu/menu_page.dart';

class MenuModule extends WidgetModule {
  MenuModule({Key? key}) : super(key: key);

  @override
  final List<Bind<Object>> binds = [];

  @override
  final Widget view = MenuPage(colorStore: Modular.get<ColorStore>());
}
