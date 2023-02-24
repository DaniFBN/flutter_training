import 'package:flutter/material.dart';
import 'package:styling_platform_class/app/random_color.dart';

class HomeAndroidPage extends StatelessWidget {
  const HomeAndroidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (_, __) => const RandomContainer(),
    );
  }
}
