import 'package:flutter/material.dart';

import 'core/shared/services/local_storage/local_storage_service.dart';
import 'core/shared/services/navigation_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.localStorageService,
  });

  final LocalStorageService localStorageService;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));

      NavigationService.instance.pushReplacement('/todo/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(child: Center(child: Text('Carregando...')));
  }
}
