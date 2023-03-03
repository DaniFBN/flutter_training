import 'package:design_system/src/widgets/text_fields/_text_field.dart';
import 'package:flutter/material.dart';

class AppPasswordFieldWidget extends StatefulWidget {
  const AppPasswordFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.prefixText,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final String? prefixText;
  final TextInputType? keyboardType;

  @override
  State<AppPasswordFieldWidget> createState() => _AppPasswordFieldWidgetState();
}

class _AppPasswordFieldWidgetState extends State<AppPasswordFieldWidget> {
  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFieldWidget(
      controller: widget.controller,
      label: widget.label,
      keyboardType: widget.keyboardType,
      prefixText: widget.prefixText,
      obscureText: obscureText,
      suffixIcon: IconButton(
        icon: obscureText
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
        onPressed: toggleObscureText,
      ),
    );
  }
}
