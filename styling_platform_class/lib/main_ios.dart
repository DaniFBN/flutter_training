import 'package:flutter/cupertino.dart';
import 'package:styling_platform_class/environment_store.dart';

import 'app/pages/home/home_page.dart';

void main() {
  environmentStore = EnvironmentStore(Environment.iOS);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomePage(),
      title: 'Flutter Demo',
      theme: CupertinoThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
    );
  }
}
