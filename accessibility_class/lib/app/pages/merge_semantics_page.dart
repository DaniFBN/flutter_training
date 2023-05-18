import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MergeSemanticsPage extends StatefulWidget {
  const MergeSemanticsPage({super.key});

  @override
  State<MergeSemanticsPage> createState() => _MergeSemanticsPageState();
}

class _MergeSemanticsPageState extends State<MergeSemanticsPage> {
  @override
  void initState() {
    super.initState();

    talkBack();
  }

  void talkBack() async {
    await SemanticsService.announce(
      'Devo ser interrompido Devo ser interrompido Devo ser interrompido Devo ser interrompido ',
      TextDirection.ltr,
      // assertiveness: Assertiveness.assertive
    );

    await SemanticsService.announce(
      'Você chegou na Merge Semantics Page',
      TextDirection.ltr,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.runtimeType.toString(),
      body: Column(
        children: [
          const Column(
            children: [
              Text('Teste 1'),
              Divider(),
              Text('Teste 2'),
            ],
          ),
          const Divider(),
          const MergeSemantics(
            child: Column(
              children: [
                Text('Teste 1'),
                Text('Teste 2'),
              ],
            ),
          ),
          const Divider(),
          Card(
            semanticContainer: true,
            child: Semantics(
              label: 'Teste de Semantics',
              child: const Column(
                children: [
                  Text('Teste 1'),
                  Text('Teste 2'),
                ],
              ),
            ),
          ),
          const Divider(),
          // ignore: avoid_unnecessary_containers
          Container(
            child: const Column(
              children: [
                Text('Teste 1'),
                Text('Teste 2'),
              ],
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Título'),
            subtitle: Text('Subtítulo'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
