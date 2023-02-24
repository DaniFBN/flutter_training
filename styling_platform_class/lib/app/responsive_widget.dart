import 'package:flutter/cupertino.dart';
import 'package:styling_platform_class/environment_store.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget android;
  final Widget ios;
  final Widget web;

  const ResponsiveWidget({
    Key? key,
    required this.android,
    required this.ios,
    required this.web,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth > 600) {
          return web;
        } else if (environmentStore.isAndroid) {
          return android;
        } else {
          return ios;
        }
      },
    );
  }
}
