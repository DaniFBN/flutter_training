import 'package:flutter/material.dart';
import 'package:ifood_example/app/mock/app_mock.dart';
import 'package:ifood_example/app/widgets/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const HomeAppBarWidget(
        address: AppMock.userAddress,
        notificationLength: AppMock.notificationLength,
      ),
    );
  }
}
