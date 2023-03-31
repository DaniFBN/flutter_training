import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presenter/pages/widgets/custom_field.dart';
import '../controllers/form_cubit_controller.dart';
import '../cubits/states/form_cubit_state.dart';

class FormCubitPage extends StatefulWidget {
  const FormCubitPage({
    super.key,
    required this.formController,
  });

  final FormCubitController formController;

  @override
  State<FormCubitPage> createState() => _FormCubitPageState();
}

class _FormCubitPageState extends State<FormCubitPage> {
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
      floatingActionButton: BlocBuilder(
        bloc: widget.formController.formCubit,
        builder: (_, state) {
          if (state is LoadingFormCubitState) {
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
