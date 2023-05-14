import 'package:flutter/material.dart';
import 'package:styling_platform_class/app/home_page.dart';
import 'package:styling_platform_class/environment_store.dart';

void main() {
  environmentStore = EnvironmentStore(Environment.android);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale('pt', 'BR'),
      home: const HomePage(),
    );
  }
}
