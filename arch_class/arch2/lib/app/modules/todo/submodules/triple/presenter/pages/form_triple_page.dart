import 'package:arch2/app/modules/todo/presentation/reactivities/value_notifiers/states/form_notifier_state.dart';
import 'package:flutter/material.dart';

import '../../../notifier/presenter/controllers/form_notifier_controller.dart';

class FormPage extends StatelessWidget {
  const FormPage({
    Key? key,
    required this.formController,
  }) : super(key: key);

  final FormController formController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formController.formKey,
          child: Column(
            children: [
              _CustomField(
                label: 'User ID',
                controller: formController.userIDController,
              ),
              _CustomField(
                label: 'Titulo',
                controller: formController.titleController,
              ),
              _CustomField(
                label: 'Descrição',
                controller: formController.descriptionController,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: formController.formNotifier,
        child: FloatingActionButton(
          onPressed: formController.addTodo,
          child: const Icon(Icons.add),
        ),
        builder: (_, state, child) {
          if (state is LoadingFormNotifierState) {
            return const FloatingActionButton(
              onPressed: null,
              child: CircularProgressIndicator(),
            );
          }

          return child!;
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
