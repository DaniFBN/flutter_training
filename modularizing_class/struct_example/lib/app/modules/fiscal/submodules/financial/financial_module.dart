import 'package:flutter_modular/flutter_modular.dart';

import 'financial_page.dart';

class FinancialModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => const FinancialBind()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const FinancialPage()),
  ];
}

class FinancialBind {
  const FinancialBind();
}
