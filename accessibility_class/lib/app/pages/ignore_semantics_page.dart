import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class IgnoreSemanticsPage extends StatelessWidget {
  const IgnoreSemanticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: runtimeType.toString(),
      body: const Row(
        children: [
          Text('Teste Funcional', semanticsLabel: 'Whatever'),
          Column(
            children: [
              Text('Teste Funcional', semanticsLabel: 'Whatever'),
              ExcludeSemantics(
                excluding: false,
                child: Column(
                  children: [
                    Text('Exclude False 1'),
                    Text('Exclude False 2'),
                  ],
                ),
              ),
              ExcludeSemantics(
                child: Column(
                  children: [
                    Text('Exclude True 1'),
                    Text('Exclude True 2'),
                  ],
                ),
              ),
              MergeSemantics(
                child: Column(
                  children: [
                    BlockSemantics(
                      child: Column(
                        children: [
                          Text('Semantics Exclude 1'),
                          Text('Semantics Exclude 2'),
                        ],
                      ),
                    ),
                    Text('Semantics Exclude 3'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Message -> Normal
// Nó(Card, ListTile, MergeSemantics, Semantics[container:true]) -> Tudo dentro vai ser lido junto
//   Message -> Ignorado pelo Block
//   Message -> Ignorado pelo Block
//   Block -> Ele mata o que vem antes no Nó dele
// Message -> Normal


// Message -> Ignorado pelo Block
// Message -> Ignorado pelo Block
// Message -> Ignorado pelo Block
// Block -> Ele mata o que vem antes no Nó dele
// Message -> Normal
