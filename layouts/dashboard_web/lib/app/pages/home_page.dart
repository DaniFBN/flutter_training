import 'package:dashboard_web/app/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          Text('Body'),
        ],
      ),
    );
  }
}
