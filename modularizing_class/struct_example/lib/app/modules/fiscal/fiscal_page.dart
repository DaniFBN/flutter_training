import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../../core/modules/theme/theme_module.dart';
import '../../core/modules/user/user_module.dart';
import 'fiscal_module.dart';

class FiscalPage extends StatelessWidget {
  const FiscalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<AppModuleBind>();
    Modular.get<UserBind>();
    Modular.get<ThemeBind>();
    Modular.get<FiscalBind>();

    return Scaffold(
      appBar: AppBar(title: const Text('FiscalPage')),
    );
  }
}
