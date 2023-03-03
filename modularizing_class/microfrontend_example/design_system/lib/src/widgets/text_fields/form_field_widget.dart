import 'package:design_system/src/widgets/text_fields/_text_field.dart';
import 'package:flutter/material.dart';

class AppFormFieldWidget extends StatelessWidget {
  const AppFormFieldWidget({
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
  Widget build(BuildContext context) {
    return AppTextFieldWidget(
      controller: controller,
      label: label,
      keyboardType: keyboardType,
      prefixText: prefixText,
    );
  }
}
