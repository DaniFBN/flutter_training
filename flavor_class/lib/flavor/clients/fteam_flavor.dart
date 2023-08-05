import 'package:flutter/material.dart';

import '../app_flavor.dart';
import '../i_flavor_client.dart';

class FTeamFlavor implements IClientFlavor {
  const FTeamFlavor({required this.environment});

  @override
  final Environment environment;

  @override
  String get imageUrl =>
      'https://avatars.githubusercontent.com/u/63812934?s=200&v=4';

  @override
  String get name => 'FTeam App';

  @override
  ThemeData get theme => ThemeData.from(
        colorScheme: ColorScheme.light(primary: Colors.blue.shade900),
      );
}



// AppModule
//   HomeModule = /
//     HomePage = / -> /
//   RHModule = /rh
//     RhPage = /rh -> /rh/rh
//   FiscalModule = /fiscal
//     FiscalPage = /fiscal -> /fiscal/fiscal

// class AppRoutes{
//   static const fiscalModulePath = '/fiscal';
//   static const fiscalPagePath = '/fiscal';
//   static const fiscalPathFullPath = fiscalModulePath + fiscalPagePath;
// }
