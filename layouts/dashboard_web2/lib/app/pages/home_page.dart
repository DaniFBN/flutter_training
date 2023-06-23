import 'package:dashboard_web2/app/widgets/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            width: 250,
            height: MediaQuery.sizeOf(context).height,
            child: const Text('Drawer'),
          ),
          const Expanded(child: AppBarWidget()),
        ],
      ),
    );
  }
}
