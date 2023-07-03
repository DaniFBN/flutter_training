import 'package:flutter/material.dart';

import 'custom_field.dart';
import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.controller,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  TextEditingController get controller => widget.controller;

  bool obscureText = true;

  void toggleVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomField(
      label: 'Senha',
      field: CustomTextField(
        controller: controller,
        focusNode: widget.focusNode,
        obscureText: obscureText,
        autofill: const [AutofillHints.password],
        hintText: 'Digite sua senha',
        required: false,
        suffix: IconButton(
          onPressed: toggleVisibility,
          icon: Icon(
            obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
        ),
        validator: (value) {
          if (value!.length < 8) {
            return 'A senha deve conter mais que 8 caracteres';
          }

          return null;
        },
      ),
    );
  }
}
