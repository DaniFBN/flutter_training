import 'package:flutter_modular/flutter_modular.dart';
import 'package:struct_example/app/modules/fiscal/fiscal_page.dart';
import 'package:struct_example/app/modules/fiscal/submodules/financial/financial_module.dart';

class FiscalModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => const FiscalBind()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const FiscalPage()),
    ModuleRoute('/financial', module: FinancialModule()),
  ];
}

class FiscalBind {
  const FiscalBind();
}
