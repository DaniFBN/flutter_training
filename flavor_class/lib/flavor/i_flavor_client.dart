import 'package:flutter/material.dart';

import 'app_flavor.dart';

abstract class IClientFlavor {
  String get name;
  String get imageUrl;
  ThemeData get theme;
  Environment get environment;
}