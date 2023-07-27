import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/app_widget.dart';

import 'app/app_module.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
