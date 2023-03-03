import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_example/app/core/color/color_store.dart';

import '../../core/shared/log.dart';

class SpecialBlueGuard extends RouteGuard {
  SpecialBlueGuard() : super(redirectTo: '/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final colorStore = Modular.get<ColorStore>();

    final condition = colorStore.color == Colors.blue ||
        colorStore.color == Colors.indigo.shade400;
    var message = 'Bloqueado pelo SpecialBlueGuard';
    if (condition) {
      message = 'Autorizado pelo SpecialBlueGuard';
    }

    OxLog.guard(message);

    return condition;
  }
}
