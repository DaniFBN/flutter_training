import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presenter/pages/widgets/custom_field.dart';
import '../blocs/states/form_bloc_state.dart';
import '../controllers/form_bloc_controller.dart';

class FormBlocPage extends StatefulWidget {
  const FormBlocPage({
    super.key,
    required this.formController,
  });

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
