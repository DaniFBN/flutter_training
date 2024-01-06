// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:default_design/default_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:html_wrapper/html_wrapper.dart' as html;

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
      assertiveness: Assertiveness.assertive,
    );

    await SemanticsService.announce(
      'Você chegou na Merge Semantics Page',
      TextDirection.ltr,
      assertiveness: Assertiveness.polite,
    );
  }

  String status = 'open';

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: widget.runtimeType.toString(),
      body: Column(
        children: [
          Semantics(
            child: Dismissible(
              key: ValueKey('33-$status'),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                print(direction);
                setState(() {
                  if (status == 'closed') {
                    status = 'open';
                  } else {
                    status = 'closed';
                  }
                });
              },
              child: Column(
                children: [
                  const Visibility(
                    visible: true,
                    child: Text('Teste 1'),
                  ),
                  const Divider(),
                  Text('Teste 2 $status'),
                ],
              ),
            ),
          ),
          const Divider(),
          const Column(
            children: [
              MpText(
                content: 'Teste 1',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              SelectableText('Teste 2'),
            ],
          ),
          const Divider(),
          MergeSemantics(
            child: Column(
              children: [
                const Text('Teste 1'),
                const Text('Teste 2'),
                const Icon(
                  Icons.error,
                  semanticLabel: 'Erro',
                ),
                Image.network(
                  'https://avatars.githubusercontent.com/u/54218517?v=4',
                  width: 20,
                  height: 20,
                  semanticLabel: 'Github',
                ),
              ],
            ),
          ),
          const Divider(),
          Card(
            semanticContainer: true,
            child: GestureDetector(
              onTap: () {},
              onLongPress: () {},
              onPanUpdate: (_) {},
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Text('Teste 1'),
                    Text('Teste 2'),
                  ],
                ),
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

class MpText extends StatelessWidget {
  final String content;
  final TextStyle? style;

  const MpText({
    Key? key,
    required this.content,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textScaleFactor = MediaQuery.textScaleFactorOf(context);
    final textDirection = Directionality.of(context);

    return html.Text(
      content,
      tag: html.Tag.h6,
      style: style ?? theme.textTheme.bodyMedium,
      textDirection: textDirection,
      textScaleFactor: textScaleFactor,
      
    );
  }
}
