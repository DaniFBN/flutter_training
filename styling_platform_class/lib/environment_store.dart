import 'package:flutter/cupertino.dart';

class EnvironmentStore extends ValueNotifier<Environment> {
  EnvironmentStore(super.value);

  bool get isAndroid => value == Environment.android;
  bool get isIos => value == Environment.iOS;
}

enum Environment { android, iOS }

late final EnvironmentStore environmentStore;
