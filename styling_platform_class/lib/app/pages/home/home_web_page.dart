import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../random_color.dart';

class HomeWebPage extends StatefulWidget {
  const HomeWebPage({super.key});

  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}

class _HomeWebPageState extends State<HomeWebPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (_, __) => const RandomContainer(),
    );
  }
}
