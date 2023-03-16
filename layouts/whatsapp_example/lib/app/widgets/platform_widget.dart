import 'package:flutter/material.dart';

import '../stores/platform_store.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget({
    Key? key,
    required this.platformStore,
    required this.iosChild,
    required this.androidChild,
  }) : super(key: key);

  final PlatformStore platformStore;
  final Widget iosChild;
  final Widget androidChild;

  @override
  Widget build(BuildContext context) {
    if (platformStore.isIos) {
      return iosChild;
    }

    return androidChild;
  }
}
