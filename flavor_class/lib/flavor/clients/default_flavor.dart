import 'package:flutter/material.dart';

import '../app_flavor.dart';
import '../i_flavor_client.dart';

class DefaultFlavor implements IClientFlavor {
  const DefaultFlavor({required this.environment});

  @override
  final Environment environment;

  @override
  String get imageUrl => 'https://avatars.githubusercontent.com/u/54218517?v=4';

  @override
  String get name => 'Default App';

  @override
  ThemeData get theme => ThemeData.from(
        colorScheme: const ColorScheme.light(primary: Colors.amber),
      );
}
