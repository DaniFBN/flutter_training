import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../controllers/form_triple_controller.dart';

class FormTriplePage extends StatefulWidget {
  const FormTriplePage({
    Key? key,
    required this.formController,
  }) : super(key: key);

  final FormTripleController formController;

  @override
  State<FormTriplePage> createState() => _FormTriplePageState();
}

class _FormTriplePageState extends State<FormTriplePage> {
  @override
  void dispose() {
    widget.formController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: widget.formController.formKey,
          child: Column(
            children: [
              _CustomField(
                label: 'User ID',
                controller: widget.formController.userIDController,
              ),
              _CustomField(
                label: 'Titulo',
                controller: widget.formController.titleController,
              ),
              _CustomField(
                label: 'Descrição',
                controller: widget.formController.descriptionController,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ScopedBuilder(
        store: widget.formController.formTriple,
        onLoading: (_) {
          return const FloatingActionButton(
            onPressed: null,
            child: CircularProgressIndicator(),
          );
        },
        onState: (_, __) {
          return FloatingActionButton(
            onPressed: widget.formController.addTodo,
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}

class _CustomField extends StatelessWidget {
  const _CustomField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLines,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo requerido';
              }

              return null;
            },
            decoration: const InputDecoration(
              filled: true,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
