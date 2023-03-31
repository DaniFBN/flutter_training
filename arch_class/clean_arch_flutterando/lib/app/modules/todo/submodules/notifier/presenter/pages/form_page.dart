import 'package:flutter/material.dart';

import '../../../../presenter/pages/widgets/custom_field.dart';
import '../controllers/form_notifier_controller.dart';
import '../stores/states/form_notifier_state.dart';

class FormNotifierPage extends StatelessWidget {
  const FormNotifierPage({
    super.key,
    required this.formController,
  });

  final FormNotifierController formController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formController.formKey,
          child: Column(
            children: [
              CustomField(
                label: 'User ID',
                controller: formController.userIDController,
              ),
              CustomField(
                label: 'Titulo',
                controller: formController.titleController,
              ),
              CustomField(
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
