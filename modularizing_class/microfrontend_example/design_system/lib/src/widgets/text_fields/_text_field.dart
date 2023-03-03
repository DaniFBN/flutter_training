import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.prefixText,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String label;
  final String? prefixText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefixText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
