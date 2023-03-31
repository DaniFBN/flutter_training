import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../presenter/pages/widgets/custom_field.dart';
import '../controllers/form_triple_controller.dart';

class FormTriplePage extends StatefulWidget {
  const FormTriplePage({
    super.key,
    required this.formController,
  });

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
        padding: const EdgeInsets.all(8),
        child: Form(
          key: widget.formController.formKey,
          child: Column(
            children: [
              CustomField(
                label: 'User ID',
                controller: widget.formController.userIDController,
              ),
              CustomField(
                label: 'Titulo',
                controller: widget.formController.titleController,
              ),
              CustomField(
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
