import 'package:flutter/material.dart';

import 'controllers/counter_controller.dart';
import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InheritedWidgetExample',
      home: CounterController(child: const HomePage()),
    );
  }
}
