import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';

class IgnoreSemanticsPage extends StatelessWidget {
  const IgnoreSemanticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: runtimeType.toString(),
      body: Column(
        children: [
          const Text('Teste Funcional'),
          const ExcludeSemantics(
            excluding: false,
            child: Column(
              children: [
                Text('Teste 1'),
                Text('Teste 2'),
              ],
            ),
          ),
          Semantics(
            excludeSemantics: true,
            child: const Column(
              children: [
                Text('Teste 1'),
                Text('Teste 2'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
