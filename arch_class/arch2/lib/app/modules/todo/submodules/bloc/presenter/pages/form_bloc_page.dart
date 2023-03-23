import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/states/form_bloc_state.dart';
import '../controllers/form_bloc_controller.dart';

class FormBlocPage extends StatefulWidget {
  const FormBlocPage({
    Key? key,
    required this.formController,
  }) : super(key: key);

  final FormBlocController formController;

  @override
  State<FormBlocPage> createState() => _FormBlocPageState();
}

class _FormBlocPageState extends State<FormBlocPage> {
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
      floatingActionButton: BlocBuilder(
        bloc: widget.formController.formBloc,
        builder: (_, state) {
          if (state is LoadingFormBlocState) {
            return const FloatingActionButton(
              onPressed: null,
              child: CircularProgressIndicator(),
            );
          }

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
