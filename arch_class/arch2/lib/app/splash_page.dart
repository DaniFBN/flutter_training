import 'package:arch2/app/core/shared/services/navigation_service.dart';
import 'package:flutter/material.dart';

import 'core/shared/services/local_storage/local_storage_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
    required this.localStorageService,
  }) : super(key: key);

  final LocalStorageService localStorageService;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      widget.localStorageService.load(),
    ]).then((value) {
      NavigationService.instance.pushReplacement('/todo/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(child: Center(child: Text('Carregando...')));
  }
}
