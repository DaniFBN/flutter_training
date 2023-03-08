import 'package:flutter/cupertino.dart';

enum Platform { android, ios }

class PlatformStore extends ValueNotifier<Platform> {
  PlatformStore() : super(Platform.ios);

  bool get isIos => value == Platform.ios;

  void toggle() {
    if (value == Platform.ios) {
      value = Platform.android;
    } else {
      value = Platform.ios;
    }
  }
}

final platformStore = PlatformStore();
