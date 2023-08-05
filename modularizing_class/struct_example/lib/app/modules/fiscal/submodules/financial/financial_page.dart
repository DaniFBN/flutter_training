import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:struct_example/app/app_module.dart';
import 'package:struct_example/app/core/modules/theme/theme_module.dart';
import 'package:struct_example/app/core/modules/user/user_module.dart';
import 'package:struct_example/app/modules/fiscal/fiscal_module.dart';
import 'package:struct_example/app/modules/fiscal/submodules/financial/financial_module.dart';

import '../../../../core/shared/services/navigator_service.dart';

class FinancialPage extends StatelessWidget {
  const FinancialPage({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<AppModuleBind>();
    Modular.get<UserBind>();
    Modular.get<ThemeBind>();
    Modular.get<FinancialBind>();
    Modular.get<FiscalBind>();

    return Scaffold(
      appBar: AppBar(title: const Text('FinancialPage')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => NavigatorService.pushNamed('/fiscal/'),
              child: const Text('Fiscal'),
            ),
            ElevatedButton(
              onPressed: () => NavigatorService.pushReplacementNamed('/rh/'),
              child: const Text('Rh'),
            ),
          ],
        ),
      ),
    );
  }
}
