import 'dart:html';

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Card(
          elevation: 10,
          color: Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          margin: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: 75,
            height: constraints.maxHeight,
            child: ListView.separated(
              itemCount: 50,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, index) {
                return const Icon(Icons.add);
              },
            ),
          ),
        );
      },
    );
  }
}
