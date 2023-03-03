import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class QuantifierPage extends StatelessWidget {
  const QuantifierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: 'Quantifier Page',
      body: Column(
        children: const [
          Text('"*" - Deve ter 0 a N caracteres'),
          Text('"+" - Deve ter 1 a N caracteres'),
          Text('"?" - Deve ter 0 a 1 caracteres'),
          Text('"{3}" - Deve ter 3 caracteres'),
          Text('"{2,20}" - Deve ter de 2 a 20 caracteres'),
        ],
      ),
    );
  }
}
