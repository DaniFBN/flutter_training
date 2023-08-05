import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:struct_example/app/core/shared/services/navigator_service.dart';
import 'package:struct_example/app/modules/rh/rh_module.dart';

import '../../app_module.dart';
import '../../core/modules/theme/theme_module.dart';
import '../../core/modules/user/user_module.dart';

class RhPage extends StatelessWidget {
  const RhPage({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<AppModuleBind>();
    Modular.get<UserBind>();
    Modular.get<ThemeBind>();
    Modular.get<RhBind>();

    return Scaffold(
      appBar: AppBar(title: const Text('RhPage')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => NavigatorService.pushNamed('/fiscal/'),
              child: const Text('Fiscal'),
            ),
            ElevatedButton(
              onPressed: () =>
                  NavigatorService.pushReplacementNamed('/fiscal/financial/'),
              child: const Text('Financial'),
            ),
          ],
        ),
      ),
    );
  }
}
