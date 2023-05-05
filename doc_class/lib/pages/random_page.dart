import 'package:doc_example/doc_example.dart';
import 'package:flutter/material.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  final lengthController = TextEditingController();
  final maxController = TextEditingController();
  final separatorController = TextEditingController();

  String randomString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random String')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _TextField(
                  controller: lengthController,
                  label: 'Length',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TextField(
                  controller: maxController,
                  label: 'Max',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TextField(
                  controller: separatorController,
                  label: 'Separator',
                ),
              ),
            ],
          ),
          Center(child: Text(randomString))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final length = int.parse(lengthController.text);
          final max = int.parse(maxController.text);

          final result = generateRandomString(
            length: length,
            max: max,
            separator: separatorController.text,
          );

          setState(() {
            randomString = result;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const _TextField({
    Key? key,
    required this.controller,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }
}
